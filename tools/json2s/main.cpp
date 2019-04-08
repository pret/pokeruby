#include <string>
#include "global.h"
#include "itemsjson.h"
#include "mapjson.h"

int main(int argc, char ** argv) {
    if (argc < 2) {
        FATAL_ERROR("missing required argument \"tool\"\n");
    }

    std::string tool = argv[1];
    if (tool == "map") {
        argv[1] = (char *)"mapjson";
        return mapjson::main(argc - 1, argv + 1);
    }

    if (tool == "items") {
        argv[1] = (char *)"itemsjson";
        return itemsjson::main(argc - 1, argv + 1);
    }

    FATAL_ERROR("unrecognized tool identifier: \"%s\"\n", tool.c_str());
}
