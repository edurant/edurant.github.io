#include <sys/utsname.h>
#include <time.h>
#include <stdio.h>

int main(int argc, char** argv)
{
	struct utsname buf;
	uname(&buf); // must be allocated
	printf("%s\n", buf.nodename);

	time_t tim = time(NULL);
	struct tm mytm; // must be allocated
	struct tm* mytm2 = localtime_r(&tim, &mytm);
	printf("%d\n", mytm.tm_year);
	printf("%x %x\n", &mytm, mytm2);
	
	return 0;
}
