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
#define SEMPER_FIDELIS
#include "ucpp/mem.h"
#include "ucpp/cpp.h"

#include "stack.h"
#include "preproc.h"
#include "asm_file.h"
#include "c_file.h"
#include "charmap.h"
#include "pragma_parser.h"

#include "stack.h"
#include "khash.h"

Charmap *g_charmap = NULL;
FILE *g_file = NULL;
static const char *g_filename = "stdout";
bool g_lines = true;

/*
 * Print line information.
 */
static inline void AddLineInfo(const char *fn, long line)
{
    fprintf(g_file, "# %i \"%s\"\n", (int32_t)line, fn);
}

/* stacks are stacks of string * */
static void PreprocessFile(const char *restrict path, Stack *restrict defines, Stack *restrict includes, bool do_preproc)
{
    struct lexer_state ls;
    FILE *input;
    char *current_file = NULL;
    char *tmp;
    int status;

    init_cpp();

    no_special_macros = 0;
    emit_defines = emit_assertions = 0;

    init_tables(1);

    init_include_path(0);

    emit_dependencies = 0;

    init_lexer_state(&ls);
    init_lexer_mode(&ls);
    ls.flags |= HANDLE_PRAGMA | LEXER;
    ls.flags &= ~HANDLE_TRIGRAPHS;
    if (g_lines)
        ls.flags |= (LINE_NUM | GCC_LINE_NUM);
    else
        ls.flags &= ~(LINE_NUM | GCC_LINE_NUM);

    if (path != NULL && strlen(path) > 0 && strcmp(path, "-") != 0)
    {
        current_file = strdup(path);
        set_init_filename(path, 1);

        input = fopen_mmap_file(path);

        if (!input)
            FATAL_ERROR("Could not open %s: %s\n", path, strerror(errno));

        set_input_file(&ls, input);
    }
    else
    {
        current_file = strdup("<stdin>");
        set_init_filename("<stdin>", 0);

        ls.input = stdin;
    }

    // Add all our includes...
    while ((tmp = (char *)Stack_Top(includes)) != NULL)
    {
        add_incpath(tmp);
        Stack_Pop(includes);
    }

    // ...and our defines, including the PREPROC macro.
    define_macro(&ls, "PREPROC");
    while ((tmp = (char *)Stack_Top(defines)) != NULL)
    {
        define_macro(&ls, tmp);
        Stack_Pop(defines);
    }

    enter_file(&ls, ls.flags);
    // Lex through the file.
    while ((status = lex(&ls)) < CPPERR_EOF)
    {
        if (status)
        {
            // error condition -- no token was retrieved
            FATAL_ERROR("preproc: exiting because of ucpp errors.\n");
        }
        if (ls.ctok->type == PRAGMA)
        {
            const char *c = ls.ctok->name;

            /*
             * Handle the special preproc pragma.
             */
            if (do_preproc && STRING_TOKEN(*c) && !strncmp(c + 1, "preproc", 7) && c[8] == PRAGMA_TOKEN_END)
            {
                ParsePragma(c, current_file, ls.ctok->line);
            }
            /*
             * Normal pragma, just pass it through.
             */
            else
            {
                fputs("\n#pragma ", g_file);
                for (; *c; c++)
                {
                    const int t = *c;

                    if (STRING_TOKEN(t))
                    {
                        const char *end_pos = strchr(c++, PRAGMA_TOKEN_END);
                        size_t pragmalen = (end_pos != NULL && end_pos > c) ? end_pos - c : strlen(c);

                        fwrite(c, 1, pragmalen, g_file);
                        putc(' ', g_file);
                        c += pragmalen;
                    }
                    else
                    {
                        fputs(operators_name[t] ? operators_name[t] : "", g_file);
                        putc(' ', g_file);
                    }
                }
                putc('\n', g_file);
            }
        }
        // TODO: Fix line numbers. They are way off.
        else if (ls.ctok->type == CONTEXT)
        {
            if (g_lines)
            {
                free(current_file);
                current_file = strdup(ls.ctok->name);
                AddLineInfo(current_file, ls.line);
                ls.oline--;
            }

        }
        else if (ls.ctok->type != COMMENT)
        {
            fputs(STRING_TOKEN(ls.ctok->type) ? ls.ctok->name : operators_name[ls.ctok->type], g_file);
        }
    }

    free(current_file);
    /* give back memory and exit */
    wipeout();
    free_lexer_state(&ls);
}

/* Only print the contents of the file. */
static void JustPrint(const char *path)
{
    FILE *in;
    char buf[4096];
    size_t in_count;
    size_t out_count;

    if (path != NULL && strlen(path) > 0 && !strcmp(path, "-"))
    {
        in = fopen(path, "rb");

        if (!in)
            FATAL_ERROR("Could not open %s: %s\n", path, strerror(errno));
    }
    else
    {
        in = stdin;
        path = "stdin";
    }

    for (;;)
    {
        in_count = fread(buf, 1, 4096, in);
        if (unlikely(ferror(in)))
            FATAL_ERROR("Could not read %s: %s\n", path, strerror(errno));

        out_count = fwrite(buf, 1, in_count, g_file);

        if (unlikely(out_count != in_count || ferror(g_file)))
            FATAL_ERROR("Could not write to %s: %s\n", g_filename, strerror(errno));
        if (feof(in))
            break;
    }
    putc_unlocked('\n', g_file);

    if (in != stdin)
        fclose(in);
}

void PrintAsmBytes(unsigned char *s, int length)
{
    if (length > 0)
    {
        int i;
        fputs("\t.byte ", g_file);
        for (i = 0; i < length; i++)
        {
            fprintf(g_file, "0x%02X", s[i]);

            if (i < length - 1)
                putc_unlocked(',', g_file);
        }
        putc_unlocked('\n', g_file);
    }
}

KHASH_MAP_INIT_STR(File, int)

void PreprocAsmFile(const char *filename)
{
    Stack *stack = Stack_NewClass(AsmFile);
    khash_t(File) *hash = kh_init(File);
    int status;
    khiter_t i;
    char *tmp = (char *)malloc(strlen(filename) + 1);
    strcpy(tmp, filename);
    i = kh_put(File, hash, tmp, &status);

    kh_value(hash, i) = 1;

    Stack_Push(stack, AsmFile_New(filename));
    for (;;)
    {
        while (AsmFile_IsAtEnd((AsmFile *)Stack_Top(stack)))
        {
            Stack_Pop(stack);

            if (Stack_Empty(stack))
                goto cleanup;
            else
                AsmFile_OutputLocation((AsmFile *)Stack_Top(stack));
        }

        Directive directive = AsmFile_GetDirective((AsmFile *)Stack_Top(stack));

        switch (directive)
        {
        case Directive_Include:
        {
            char *name = AsmFile_ReadPath((AsmFile *)Stack_Top(stack));

            // We only allow up to 32 includes of a single file.
            i = kh_get(File, hash, name);
            if (i == kh_end(hash))
            {
                i = kh_put(File, hash, name, &status);
                kh_value(hash, i) = 1;
            }
            else
            {
                if (kh_value(hash, i)++ > 32)
                    FATAL_ERROR("File '%s' included too many times\n", name);
                free(name);
            }
            AsmFile *file = AsmFile_New(name);
            Stack_Push(stack, file);
            AsmFile_OutputLocation((AsmFile *)Stack_Top(stack));
            break;
        }
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
            char *globalLabel = AsmFile_GetGlobalLabel((AsmFile *)Stack_Top(stack));

            if (globalLabel != NULL)
            {
                fprintf(g_file, "%s: ; .global %s\n", globalLabel, globalLabel);
                free(globalLabel);
            }
            else
            {
                AsmFile_OutputLine((AsmFile *)Stack_Top(stack));
            }
            break;
        }
        }
    }
cleanup:
    for (i = kh_begin(hash); i != kh_end(hash); i++)
    {
        if (kh_exist(hash, i)) {
            free((char *)kh_key(hash, i));
            kh_del(File, hash, i);
        }
    }
    kh_destroy(File, hash);
    Stack_Delete(stack);
}

static inline void PreprocCFile(const char *restrict filename)
{
    CFile *const cFile = CFile_New(filename);
    CFile_Preproc(cFile);
}

static inline void usage(const char *progname)
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

static const char *GetFileExtension(const char *filename)
{
    size_t i;
    if (!filename)
        return "c";

    i = strlen(filename) - 1;

    if (i < 2)
        return "c";

    do
    {
        if (filename[i - 1] == '.')
            return filename + i;
    } while (i-- > 1);

    return "c";
}

int main(int argc, char **argv)
{
    Stack *defines = Stack_NewWithSizeAndDtor(sizeof(char *), NULL);
    Stack *includes = Stack_NewWithSizeAndDtor(sizeof(char *), NULL);
    const char *path = NULL;
    const char *extension = NULL;
    const char *output = NULL;
    int c;
    bool do_preproc = false;
    bool do_cpp = true;

    opterr = 0;

    g_file = stdout;

    while ((c = getopt(argc, argv, "-:D:I:x:c:Pno:h")) != -1)
    {
        switch (c)
        {
        case 'D':
            Stack_Push(defines, optarg);
            break;
        case 'I':
            Stack_Push(includes, optarg);
            break;
        case 'x':
            if (optarg[0] == 'c' && optarg[1] == 0)
            {
                extension = "c";
            }
            else if ((optarg[0] == 's' && optarg[1] == 0) || unlikely(!strcmp(optarg, "asm"))
                     || unlikely(!strcmp(optarg, "assembler")))
            {
                extension = "s";
            }
            else if ((optarg[0] == 'i' && optarg[1] == 0)
                     || unlikely(!strcmp(optarg, "cpp-output")))
            {
                extension = "i";
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
            g_lines = false;
            break;
        case 'n':
            do_cpp = false;
            break;
        case 'o':
            output = optarg;
            break;
        case 'h':
            usage(argv[0]);
            return 0;
        case '\1':
            path = optarg;
            break;
        case ':':
            fprintf(stderr, "-%c: missing argument\n", optopt);
        // fall through
        case '?':
            usage(argv[0]);
            return 1;
        }
    }

    if (!path || optind < argc)
        path = argv[optind];

    if (output != NULL)
    {
        g_filename = output;
        g_file = fopen(output, "wb");
        if (!g_file)
            FATAL_ERROR("Failed to open output file %s: %s", output, strerror(errno));
    }

    if (!extension)
        extension = GetFileExtension(path);


    // Just print the output of the file.
    if (unlikely(!do_cpp && !do_preproc))
    {
        JustPrint(path);
    }
    else if (do_cpp && extension[0] != 's')
    {
        PreprocessFile(path, defines, includes, do_preproc);
    }
    else if (do_preproc && extension[0] == 's' && extension[1] == 0)
    {
        PreprocAsmFile(path);
    }
    else if (do_preproc)
    {
        PreprocCFile(path);
    }

    // always want a trailing newline
    putc_unlocked('\n', g_file);

    if (g_file != stdout)
        fclose(g_file);

    Charmap_Delete(g_charmap);
    Stack_Delete(defines);
    Stack_Delete(includes);
    return 0;
}
