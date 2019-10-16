// $Id$
// Dr. E. Durant <durant@msoe.edu>, 8 December 2004
// UNIX Signals -- example program

#include <sys/types.h> // for wait, etc.
#include <sys/wait.h> // for wait, etc.
#include <unistd.h> // fork, etc.
#include <signal.h>

#include <iostream>

void child_term(int signum) // required signal handler interface
{
	std::cout << "Caught SIGTERM, exiting." << std::endl;
	exit(0); // indicate no error -- careful - exit bypasses cleanup, dtors, etc.
}

int main(int argc, char* argv[])
{
	const int pid = fork(); // fork into 2 processes

	if (pid < 0) // error
	{
		std::cerr << "Fork failed, terminating\n";
		return EXIT_FAILURE;
	}
	else if (pid == 0) // child has PID 0
	{
		std::cout << "Child process\n";
		signal(SIGTERM, child_term); // install a handler
		while(true)
			sleep(1); // don't do anything forever (efficiently)
	}
	else // parent gets positive PID of child
	{
		std::cout << "Enter T/K to send SIGTERM/SIGKILL to child, Q to quit parent" << std::endl;
		
		char input = '?';
		bool quit = false;
		while (!quit && std::cin >> input)
		{
			switch(input)
			{
			case 'K':
				kill(pid, SIGKILL);
				break;
			case 'T':
				kill(pid, SIGTERM);
				break;
			case 'Q':
				quit = true;
				break;
			}
		}
		// We really should invalidate the pid after we terminate it, or we might
		// accidentally try to kill somebody else's process (what will happen, then?).

		// Ensure that we don't leave our child running after we exit (usually a good idea).
		pid_t rv = waitpid(pid, NULL, WNOHANG);
		if (rv == pid)
			std::cout << "Parent: the child was already terminated" << std::endl;
		else if (rv == 0) // when used with WNOHANG, means that no child was ready
		{
			std::cout << "Parent: User, you forgot to terminate the child; I will" << std::endl;
			kill(pid, SIGTERM);
		}
		else
			std::cerr << "Unexpected return value from waitpid()\n";
		// Why is it illegal to use a switch/case above?
	
		return EXIT_SUCCESS;
	}
}
