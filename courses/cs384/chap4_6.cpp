/**************************************************/
/* Multithreaded C program using the Pthread API  */
/* From Figure 4.6, Operating Systems Concepts,   */
/* 7th Edition, Silberschatz, Galvin, and Gagne   */
/*                                                */
/* 8 December 2004: Durant: updated to C++ style  */
/* 12 December 2005: Durant: updated to 7ed       */
/*                                                */
/* To compile me in Linux type:                   */
/*    g++ -o chap4_6 chap4_6.cpp -lpthread        */
/**************************************************/

#include <pthread.h>
#include <cstdio>
#include <cstdlib>

static int sum; // this data is shared by the thread(s)
void *runner(void *param); // the thread

int main(int argc, char *argv[])
{
  if (argc != 2)
  {
    fprintf(stderr, "usage: %s <integer value>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  if (atoi(argv[1]) < 0)
  {
    fprintf(stderr,"%d must be > 0\n", atoi(argv[1]));
    exit(EXIT_FAILURE);
  }

  pthread_attr_t attr;		// set of thread attributes
  pthread_attr_init(&attr);	// get the default attributes
  pthread_t tid;		// the thread identifier
  pthread_create(&tid, &attr, runner, argv[1]);	// create the thread
  pthread_join(tid,NULL);	// now wait for the thread to exit
  printf("sum = %d\n", sum);

  return EXIT_SUCCESS;
}

void *runner(void *param)
// The thread will begin control in this function
{
  int upper = atoi(static_cast<const char*>(param));
  sum = 0;
  if (upper > 0)
  {
    for (unsigned int i = 1; i <= static_cast<unsigned int>(upper); ++i)
      sum += i;
  }
  pthread_exit(0);
}
