#include <iostream>
using std::cout; using std::endl;

#include <string>
using std::string;

#include <vector>
using std::vector;

#include <algorithm>
using std::sort; using std::find;

#include <map>
using std::map;

#include <fstream>
using std::ofstream; using std::ifstream;

#include <sstream>
using std::ostringstream;

#include <limits>
using std::numeric_limits;

#include "json11.h"
using json11::Json;

#include "global.h"
#include "itemsjson.h"

namespace itemsjson {

    string read_text_file(string filepath) {
        ifstream in_file(filepath);

        if (!in_file.is_open())
            FATAL_ERROR("Cannot open file %s for reading.\n", filepath.c_str());

        string text;

        in_file.seekg(0, std::ios::end);
        text.resize(in_file.tellg());

        in_file.seekg(0, std::ios::beg);
        in_file.read(&text[0], text.size());

        in_file.close();

        return text;
    }
    string get_directory_name(string filename) {
        size_t dir_pos = filename.find_last_of("/\\");

        return filename.substr(0, dir_pos + 1);
    }

    void write_text_file(string filepath, string text) {
        ofstream out_file(filepath, std::ofstream::binary);

        if (!out_file.is_open())
            FATAL_ERROR("Cannot open file %s for writing.\n", filepath.c_str());

        out_file << text;

        out_file.close();
    }

    string generate_items_text(Json &items_data, string &language) {
        ostringstream text;

        text << "const struct Item gItems[] = {\n";

        for (auto &item : items_data["items"].array_items()) {
            string itemId = item["itemId"].string_value();

            text << "    {\n";
            text << "        .name = " << item[language].string_value() << ",\n";
            text << "        .itemId = " << item["itemId"].string_value() << ",\n";
            text << "        .price = " << item["price"].int_value() << ",\n";
            text << "        .holdEffect = " << item["holdEffect"].string_value() << ",\n";
            text << "        .holdEffectParam = " << item["holdEffectParam"].int_value() << ",\n";
            text << "        .description = gItemDescription_" << itemId.substr(5) << ",\n";
            text << "        .importance = " << item["importance"].int_value() << ",\n";
            text << "        .exitsBagOnUse = " << item["exitsBagOnUse"].int_value() << ",\n";
            text << "        .pocket = " << item["pocket"].string_value() << ",\n";
            text << "        .type = " << item["type"].int_value() << ",\n";
            text << "        .fieldUseFunc = " << item["fieldUseFunc"].string_value() << ",\n";
            text << "        .battleUsage = " << item["battleUsage"].int_value() << ",\n";
            text << "        .battleUseFunc = " << item["battleUseFunc"].string_value() << ",\n";
            text << "        .secondaryId = " << item["secondaryId"].int_value() << ",\n";
            text << "    },\n";
        }

        text << "};\n";

        return text.str();
    }

    string generate_items_description_text(Json &items_data, string &language) {
        ostringstream text;

        for (auto &item : items_data["items"].array_items()) {
            string itemId = item["itemId"].string_value();
            string desc = item["description_" + language].string_value();
            if (desc != "") {
                text << "const u8 gItemDescription_" << itemId.substr(5) << "[] = _(\n";
                int pos;
                while ((pos = desc.find('\n')) != std::string::npos) {
                    text << "    \"" << desc.substr(0, pos) << "\\n\"\n";
                    desc.erase(0, pos + 1);
                }
                text << "    \"" << desc << "\");\n";
            }
        }

        text << "const u8 gItemDescription_NONE[] = _(\"\");\n";

        return text.str();
    }

    void process_items(string filepath, string language = "english") {
        string err;
        Json items_data = Json::parse(read_text_file(filepath), err);

        if (items_data == Json())
            FATAL_ERROR("%s\n", err.c_str());

        string items_text = generate_items_text(items_data, language);
        string items_descriptions_text = generate_items_description_text(items_data, language);

        string file_dir = get_directory_name(filepath);
        char s = file_dir.back();

        write_text_file(file_dir + ".." + s + "src" + s + "data" + s + "items.h", items_text);
        write_text_file(file_dir + ".." + s + "src" + s + "data" + s + "item_descriptions.h", items_descriptions_text);
    }

    int main(int argc, char *argv[]) {
        if (argc < 3)
            FATAL_ERROR("USAGE: itemsjson <language> <filepath>\n");

        char *language_arg = argv[1];
        string language(language_arg);
        if (language != "english" && language != "german")
            FATAL_ERROR("ERROR: <language> must be 'english' or 'german'\n");

        string filepath(argv[2]);
        process_items(filepath, language);

        return 0;
    }
}
