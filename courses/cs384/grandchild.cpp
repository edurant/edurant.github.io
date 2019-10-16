// $Id: grandchild.cpp,v 1.1 2004/12/13 05:49:44 durant Exp durant $

// grandchild inheritance test

#include <iostream>
#include <sys/types.h> // for fork, waitpid
#include <sys/wait.h> // waitpid
#include <unistd.h> // fork

int main()
{
	pid_t child = fork();
	if (child == 0) // we are the child
	{
		pid_t grandchild = fork();
		if (grandchild == 0) // we are the grandchild
		{
			std::cout << "Grandchild: my PID is " << getpid() << std::endl;
			std::cout << "Grandchild: my PPID is " << getppid() << std::endl;
			sleep(2); // ensure that child [my parent] is reaped first [is this guaranteed to work?]
			std::cout << "Grandchild: my PPID is " << getppid() << std::endl;
			return 0;
		}
		else if (grandchild < 0) // error
		{
			std::cerr << "Could not fork!\n";
			exit(-1);
		}
		else // positive, therefore we are the child (not the grandchild)
		{
			std::cout << "Child: my PID is " << getpid() << std::endl;
			sleep(1); // give grandchild time to check its PPID (us)
			return 0; // child (middle process) exits quickly
		}
	}
	else if (child < 0) // error
	{
		std::cerr << "Could not fork!\n";
		exit(-1);
	}
	else // positive, therefore we are the parent
	{
		sleep(3);
		system("ps -F");

		pid_t ret1 = waitpid(child, NULL, 0);
		std::cout << "Parent: reaped the child [" << ret1 << "]" << std::endl;

		//waitpid(grandchild, NULL, 0); // would need to communicate up from child
		pid_t ret2 = waitpid(-1, NULL, 0); // wait for any child, blocking
		if (ret2 == -1) // error
		{
			std::cerr << "Error waiting for child: ";
			switch (errno)
			{
			case ECHILD:
				std::cerr << "ECHILD: \n";
				break;
			case EINVAL:
				std::cerr << "EINVAL: \n";
				break;
			case EINTR:
				std::cerr << "EINTR: \n";
				break;
			default:
				std::cerr << "Unexpected error code\n";
				break;
			}
		}
		else
			std::cout << "Parent: reaped the grandchild [" << ret2 << "]" << std::endl;

		return 0;
	}
}
