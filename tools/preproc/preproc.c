// Copyright(c) 2016 YamaArashi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include <string.h>
#include <unistd.h>
#include <errno.h>

#include "ucpp/mem.h"
#include "ucpp/cpp.h"

#include "stack.h"
#include "preproc.h"
#include "asm_file.h"
#include "c_file.h"
#include "charmap.h"

#include "stack.h"
#include "my_string.h"

Charmap *g_charmap = NULL;

/*
 * Print line information.
 */
static string *AddLineInfo(string *data, char *fn, long line)
{
    char *b;

    b = (char *)getmem(50 + strlen(fn));
    int len = sprintf(b, "\nBLAH# %ld \"%s\"\n", line, fn);
    if (unlikely(len < 7))
        FATAL_ERROR("Failed to add line info!\n");

    data = string_add(data, string_tmp_len(b, (unsigned)len));

    freemem(b);
    return data;
}

/* stacks are stacks of string * */
string *PreprocessFile(const string *path, Stack *defines, Stack *includes, bool lines)
{
    int status;
    char *path_perm;
    struct lexer_state ls = { 0 };
    FILE *input;

    string *ret = empty_string();

    init_cpp();

    no_special_macros = 0;
    emit_defines = emit_assertions = 0;

    init_tables(1);

    init_include_path(0);

    emit_dependencies = 0;

    init_lexer_state(&ls);
    init_lexer_mode(&ls);
    ls.flags |= DEFAULT_CPP_FLAGS | HANDLE_PRAGMA | TEXT_OUTPUT | LEXER;
    if (!lines)
        ls.flags |= (LINE_NUM | GCC_LINE_NUM);
    else
        ls.flags &= ~(LINE_NUM | GCC_LINE_NUM);

    if (path != NULL && path->length > 0 && strcmp(path->c_str, "-") != 0)
    {
        path_perm = (char *)malloc(path->length + 1);
        memcpy(path_perm, path->c_str, path->length + 1);

        set_init_filename(path_perm, 1);

        input = fopen_mmap_file(path_perm);

        if (!input)
            FATAL_ERROR("Could not open %s: %s\n", path->c_str, strerror(errno));

        set_input_file(&ls, input);
    }
    else
    {
        set_init_filename("<stdin>\n", 0);

        ls.input = stdin;
    }

    string *tmp;
    while ((tmp = (string *)Stack_Top(includes)) != NULL)
    {
        add_incpath(tmp->c_str);
        Stack_Pop(includes);
    }

    while ((tmp = (string *)Stack_Top(defines)) != NULL)
    {
        define_macro(&ls, tmp->c_str);
        Stack_Pop(defines);
    }

    enter_file(&ls, ls.flags);

    while ((status = lex(&ls)) < CPPERR_EOF)
    {
        if (status)
        {
            /* error condition -- no token was retrieved */
            continue;
        }
        /* we print each token: its numerical value, and its
           string content; if this is a PRAGMA token, the
           string content is in fact a compressed token list,
           that we uncompress and print. */
        if (ls.ctok->type == PRAGMA)
        {
            unsigned char *c = (unsigned char *)(ls.ctok->name);

            for (; *c; c++)
            {
                int t = *c;

                if (STRING_TOKEN(t))
                {
                    for (c++; *c != PRAGMA_TOKEN_END; c++)
                        ret = string_add_char(ret, *c);
                    ret = string_add_char(ret, '\n');
                }
                else
                {
                    ret = string_add(ret, string_tmp(operators_name[t]));
                }
            }
        }
        else if (lines && ls.ctok->type == CONTEXT)
        {
            AddLineInfo(ret, ls.ctok->name, ls.ctok->line);
        }
        else if (ls.ctok->type == NEWLINE)
        {
            ret = string_add_char(ret, '\n');
        }
        else if (ls.ctok->type != COMMENT && ls.ctok->type != OPT_NONE)
        {
            unsigned i = 0;
            char *tmp = STRING_TOKEN(ls.ctok->type) ? ls.ctok->name : operators_name[ls.ctok->type];
            while (tmp[i])
                ret = string_add_char(ret, tmp[i++]);
        }
    }

    /* give back memory and exit */
    wipeout();
    free_lexer_state(&ls);

    return ret;
}

/* Only print the contents of the file. */
static void JustPrint(string *path, string *output)
{
    FILE *in;

    if (path != NULL && path->length > 0 && !strcmp(path->c_str, "-"))
    {
        in = fopen(path->c_str, "rb");

        if (!in)
            FATAL_ERROR("Could not open %s: %s\n", path->c_str, strerror(errno));
    }
    else
    {
        in = stdin;
        path = string("stdin", 5);
    }

    FILE *out;
    if (output != NULL && output->length > 0 && !strcmp(path->c_str, "-"))
    {
        out = fopen(output->c_str, "w");
        if (!out)
            FATAL_ERROR("Could not open %s: %s\n", output->c_str, strerror(errno));
    }
    else
    {
        out = stdout;
        output = string("stdout", 6);
    }

    char buf[4096];
    size_t in_count;
    size_t out_count;
    for (;;)
    {
        in_count = fread(buf, 1, 4096, in);
        if (unlikely(ferror(in)))
            FATAL_ERROR("Could not read %s: %s\n", path->c_str, strerror(errno));

        out_count = fwrite(buf, 1, in_count, out);

        if (unlikely(out_count != in_count || ferror(out)))
            FATAL_ERROR("Could not write to %s: %s\n", output->c_str, strerror(errno));
        if (feof(in))
            break;
    }
    fputc('\n', out);

    if (in != stdin)
        fclose(in);
    if (out != stdout)
        fclose(out);
}

void PrintAsmBytes(unsigned char *s, int length)
{
    if (length > 0)
    {
        printf("\t.byte ");
        for (int i = 0; i < length; i++)
        {
            printf("0x%02X", s[i]);

            if (i < length - 1)
                putchar_unlocked(',');
        }
        putchar_unlocked('\n');
    }
}


void PreprocAsmFile(string *filename, string *data)
{
    Stack *stack = Stack_NewClass(AsmFile);
    Stack_Push(stack, AsmFile_New(filename, data));

    for (;;)
    {
        while (AsmFile_IsAtEnd((AsmFile *)Stack_Top(stack)))
        {
            Stack_Pop(stack);

            if (Stack_Empty(stack))
                return;
            else
                AsmFile_OutputLocation((AsmFile *)Stack_Top(stack));
        }

        Directive directive = AsmFile_GetDirective((AsmFile *)Stack_Top(stack));

        switch (directive)
        {
        case Directive_Include:
            Stack_Push(stack, AsmFile_New(AsmFile_ReadPath((AsmFile *)Stack_Top(stack)), NULL));
            AsmFile_OutputLocation((AsmFile *)Stack_Top(stack));
            break;
        case Directive_String:
        {
            unsigned char s[kMaxStringLength];
            int length = AsmFile_ReadString((AsmFile *)Stack_Top(stack), s);
            PrintAsmBytes(s, length);
            break;
        }
        case Directive_Braille:
        {
            unsigned char s[kMaxStringLength];
            int length = AsmFile_ReadBraille((AsmFile *)Stack_Top(stack), s);
            PrintAsmBytes(s, length);
            break;
        }
        case Directive_Unknown:
        {
            string *globalLabel = AsmFile_GetGlobalLabel((AsmFile *)Stack_Top(stack));

            if (globalLabel->length != 0)
            {
                const char *s = globalLabel->c_str;
                printf("%s: ; .global %s\n", s, s);
            }
            else
            {
                AsmFile_OutputLine((AsmFile *)Stack_Top(stack));
            }

            break;
        }
        }
    }
    Stack_Delete(stack);
}

void PreprocCFile(string *filename, string *data)
{
    CFile *cFile = CFile_New(filename, data);
    CFile_Preproc(cFile);
}

void usage(char *progname)
{
    fprintf(stderr,
            "usage: %s [options] file\n"
            "\n"
            "Options:\n"
            "    -D macro[=value]   Define a macro.\n"
            "    -I path            Add a path to the include path\n"
            "    -x [extension]     Manually set the file extension.\n\n"
            "    -c charmap.txt     Set the path to charmap.txt. This\n"
            "                       enables replacement of incbins and\n"
            "                       strings after preprocessing.\n"
            "    -P                 Don't add line directives.\n"
            "    -n                 Don't preprocess the file, just replace\n"
            "                       incbins and strings. Needs -c.\n"
            "    -o output          Sets the output file instead of stdout.\n"
            "    -h                 Show this help text.\n",
            progname);
}

char *GetFileExtension(string *filename)
{
    if (!filename || filename->length < 2)
        return "c";

    char *str = filename->c_str;

    unsigned i = filename->length - 1;
    do
    {
        if (str[i - 1] == '.')
            return str + i;
    } while (i-- > 1);

    return "c";
}

int main(int argc, char **argv)
{
    Stack *defines = Stack_NewClass(string);
    Stack *includes = Stack_NewClass(string);
    string *path = NULL;
    string *file = NULL;
    char *extension = NULL;
    bool do_preproc = false;
    bool do_cpp = true;
    bool lines = true;
    int c;
    string *output = NULL;
    opterr = 0;

    while ((c = getopt(argc, argv, ":-D:I:x:c:Pno:h")) != -1)
    {
        switch (c)
        {
        case 'D':
            Stack_Push(defines, string(optarg, strlen(optarg)));
            break;
        case 'I':
            Stack_Push(includes, string(optarg, strlen(optarg)));
            break;
        case 'x':
            if (optarg[0] == 'c' && optarg[1] == 0)
            {
                extension = (char *)"c";
            }
            else if ((optarg[0] == 's' && optarg[1] == 0) || unlikely(!strcmp(optarg, "asm"))
                     || unlikely(!strcmp(optarg, "assembler")))
            {
                extension = (char *)"s";
            }
            else if ((optarg[0] == 'i' && optarg[1] == 0)
                     || unlikely(!strcmp(optarg, "cpp-output")))
            {
                extension = (char *)"i";
                do_cpp = false;
            }

            else
            {
                fputs("-x: invalid filetype\n", stderr);
                usage(argv[0]);
                return 1;
            }
            break;
        case 'c':
            g_charmap = Charmap_New(optarg);
            do_preproc = true;
            break;
        case 'P':
            lines = false;
            break;
        case 'n':
            do_cpp = false;
            break;
        case 'o':
            output = string_tmp(optarg);
            break;
        case 'h':
            usage(argv[0]);
            return 0;
        case '\1':
            path = string_tmp(optarg);
            break;
        case ':':
            fprintf(stderr, "-%c: missing argument\n", optopt);
        // fall through
        case '?':
            usage(argv[0]);
            return 1;
        }
    }

    if (optind < argc)
        path = string(argv[optind], strlen(argv[optind]));

    if (unlikely(!do_cpp && !do_preproc))
    {
        JustPrint(file, output);
        return 0;
    }

    if (!extension)
        extension = GetFileExtension(path);


    if (do_cpp && extension[0] != 's')
        file = PreprocessFile(path, defines, includes, lines);

    if (do_preproc)
    {
        if ((extension[0] == 's') && extension[1] == 0)
            PreprocAsmFile(path, file);
        else if ((extension[0] == 'c' || extension[0] == 'i') && extension[1] == 0)
            PreprocCFile(path, file);
        else
            FATAL_ERROR("\"%s\" has an unknown file extension of \"%s\".\n", argv[1], extension);
    }
    else
    {
        puts(file->c_str);
    }
    return 0;
}
