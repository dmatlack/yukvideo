/**
 * @file timediff.c
 *
 * Get the difference in minutes between the two input times.
 *
 * @author David Matlack
 */
#include <stdio.h>

struct time {
  int hh;
  int mm;
  int ss;
};

#define MINUTES(hh, mm) ((hh)*60 + (mm))

int main(int argc, char **argv) {
  struct time t1;
  struct time t2;
  int diff;
  
  if (argc != 3) { 
    printf("usage: timediff <HH:MM:SS> <HH:MM:SS>");
    return -1; 
  }
  
  sscanf(argv[1], "%d:%d:%d", &t1.hh, &t1.mm, &t1.ss);
  sscanf(argv[2], "%d:%d:%d", &t2.hh, &t2.mm, &t2.ss);

  diff = MINUTES(t2.hh, t2.mm) -  MINUTES(t1.hh, t1.mm); 
  printf("%d\n", diff);
  return 0;
}
