#include <iostream>

void dump(int argc, char* argv[])
{
        std::cout << "argc = " << argc << std::endl;

        for(unsigned int i = 0; i < argc; ++i)
                std::cout << "argv[" << i << "] (@" << static_cast<void*>(argv[i])
                << ") = {" << argv[i] << "}\n";

        std::cout << "argv[" << argc << "] (@" << static_cast<void*>(argv[argc])
                << ") should not be a valid string [null pointer expected].\n";
}
 
int main(int argc, char* argv[])
{
        dump(argc, argv);

        // copy arguments 1 through end to another array...   
        char** argv2 = new char*[argc+1]; // there are argc+1 non-null elements; we want argc elements; add 1 for terminating NULL
        memcpy(argv2, &argv[1], sizeof(char*)*(argc+1));

        dump(argc-1, argv2);
        delete[] argv2;                                                                
}
