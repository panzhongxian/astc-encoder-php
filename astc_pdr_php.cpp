#define _GLIBCXX_USE_CXX11_ABI 0
#include <string>
#include <phpcpp.h>
#include "astc_pdr.h"

Php::Value astc_encode(Php::Parameters &params){
   std::string profile = params[0];
   std::string input_filename = params[1];
   std::string compressed_output_filename = params[2];
   std::string decompressed_output_filename = params[3];
   std::string dimensions_str = params[4];
   std::string quality_str = params[5];
   return astc_compress_and_compare(profile, input_filename, compressed_output_filename,
                             decompressed_output_filename, dimensions_str,
                             quality_str);
}


// symbols are exported according to the "C" language
extern "C"
{
    // export the "get_module" function that will be called by the Zend engine
    PHPCPP_EXPORT void *get_module() 
    { 
        // create extension
        static Php::Extension extension("astc_pdr","1.0");

        // define the functions
        extension.add<astc_encode>("astc_encode");

        // return the module entry
        return extension.module();
    }
}

