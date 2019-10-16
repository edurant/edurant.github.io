#include <sys/types.h> // for wait, etc.
#include <sys/wait.h> // for wait, etc.
#include <unistd.h> // fork, etc.

#include <iostream>

int main(int argc, char* argv[])
{
	pid_t pid = fork(); // fork into 2 processes

	if (pid < 0) // error
	{
		std::cerr << "Fork failed, terminating\n";
		return EXIT_FAILURE;
	}
	else if (pid == 0) // child has PID 0
	{
		std::cout << "Child process\n";
		execlp("/bin/ps", "ps", NULL); // ps is responsible for its return code
	}
	else // parent gets positive PID of child
	{
		wait(0); // 0 means for "any of my children"
		std::cout << "Child complete\n";
		return EXIT_SUCCESS;
	}
}
