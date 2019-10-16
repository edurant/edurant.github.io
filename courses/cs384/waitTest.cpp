#include <sys/types.h>
#include <sys/wait.h>

#include <iostream>

int main(int argc, const char* const argv[])
{
	pid_t pid = fork();
	if (pid < 0) // error
	{
		std::cerr << "Could not fork, exiting.\n";
		exit(EXIT_FAILURE);
	}
	else if (pid == 0) // child
	{
		const unsigned int delay = 10;
		std::cout << "Child: sleeping for " << delay << " seconds." << std::endl;
		sleep(delay);
		std::cout << "Child: segment exiting, about to return." << std::endl;
	}
	else // parent
	{
		std::cout << "Parent: the child ID is " << pid << std::endl;
		// following code based on Knobloch et al.
		int ChildStatus;
		wait(&ChildStatus);
		std::cout << "WIFEXITED(ChildStatus) is "
			<< WIFEXITED(ChildStatus) << '\n';
		std::cout << "Child terminated "
			<< ((WIFEXITED(ChildStatus)) ? "normally.\n" : "by signal.\n");
	}

	return EXIT_SUCCESS;
}
