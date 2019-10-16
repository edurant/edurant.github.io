// Win32 Threading example, Build in Console project
// very loosely based on Figure 5.5, Operating Systems Concepts, Sixth Edition, Silberschatz et al.
// cf. Figure 4.6 in Seventh Edition
// Seventh Edition adds an alternate example using the WaitForSingleObject function of the Win32 API
// very loosely based on MSVS2002 threading documentation sample
// Dr. E. Durant <durant@msoe.edu>, 8 December 2004
// documentation updated 12 December 2005

#include <windows.h>
#include <iostream>

DWORD WINAPI ThreadFunc( LPVOID lpParam )
// Sum up integers, similar to the Linux example.
// Win32 specifies that a DWORD be returned
// The input is a void* (pointer to memory) [dangerous!, but flexible]
// - user code needs to interpret what is stored at the given address
{
    unsigned int upper = *static_cast<unsigned int*>(lpParam);
    DWORD sum = 0;
    if (upper > 0)
    {
        for (unsigned int i = 1; i <= static_cast<unsigned int>(upper); ++i)
            sum += i;
    }
    return sum; 
} 
 
void main() 
{ 
	unsigned int threadParameter = 9999;
	std::cout << "Enter value: ";
	std::cin >> threadParameter;

    DWORD dwThreadId; 
    HANDLE hThread = CreateThread( 
        NULL,                        // no security attributes 
        0,                           // use default stack size  
        ThreadFunc,                  // thread function 
        &threadParameter,            // argument to thread function 
        0,                           // use default creation flags 
        &dwThreadId);                // returns the thread identifier 
 
   if (hThread == NULL) 
	   std::cerr << "CreateThread failed.";
   else 
   {
		// Poll while the thread is active (hasn't yet returned)
		DWORD exitCode = STILL_ACTIVE; // assumption (valid, but be careful): STILL_ACTIVE does not collide with real thread return code, inefficient polling; better to use WaitForSingleObject
		while (exitCode == STILL_ACTIVE)
		{
			std::cout << '.'; // this will happen FAST, but is okay for fast demo ThreadFunc
			GetExitCodeThread(hThread, &exitCode);
		}
		std::cout << "\nThe thread returned " << exitCode << std::endl;
		
		// Wait for user to press Enter
		char c;
		std::cin.getline(&c, 1); // wait for EOL, but extract nothing (just store terminal NUL)

		CloseHandle(hThread);
   }
}
