// $Id: piping.cpp,v 1.4 2005/12/07 00:20:34 durant Exp durant $
// UNIX Piping Demo

#include <sys/types.h> // for wait, etc.
#include <sys/wait.h> // for wait, etc.
#include <unistd.h> // fork, etc.

#include <iostream>

int main(int argc, char* argv[])
{
	int pipeEndpoints[2]; // [0]read, [1]write
	if (pipe(pipeEndpoints) == -1)
	{
		std::cerr << "Error creating pipe, terminating\n";
		return EXIT_FAILURE;
	}

	pid_t pid = fork(); // fork into 2 processes.  Why is this AFTER pipe?

	if (pid < 0) // error
	{
		std::cerr << "Fork failed, terminating\n";
		return EXIT_FAILURE;
	}
	else if (pid == 0) // child has PID 0
	{
		close(pipeEndpoints[1]); // good style to close the half we don't need

		const unsigned int delay = 5;  // delay for this many seconds
		std::cout << "Child, sleeping for " << delay << " seconds" << std::endl;
		sleep(delay);

		int message = -9999;
		// Child is mostly a clone of the parent, including variables.
		std::cout << "Child process, blocking for pipe read" << std::endl;
		read(pipeEndpoints[0], &message, sizeof(int));
		// blocking, check for error? [open/fcntl yourself if you want non-blocking

		std::cout << "Child done blocking [" << message << ']' << std::endl;

		return EXIT_SUCCESS;
	}
	else // parent gets positive PID of child
	{
		close(pipeEndpoints[0]); // good style to close the half we don't need

		std::cout << "Parent: input an integer: ";
		int input;
		std::cin >> input;

		write(pipeEndpoints[1], &input, sizeof(int)); // check for error?

		close(pipeEndpoints[1]);

		// without wait, child is inherited by init, which will reap it upon exit 
		return EXIT_SUCCESS;
	}
}
