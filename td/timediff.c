/**
 * @file timediff.c
 *
 * Get modification time difference between two files
 *
 * @author David Matlack
 */
#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <sys/stat.h>

#define MINUTES(hh, mm) ((hh)*60 + (mm))

int main(int argc, char **argv) {
  struct stat fs1;
  struct stat fs2;
  int diff_minutes;

  if (argc != 3) { 
    printf("usage: timediff <file1> <file2>");
    return -1;
  }

  if (stat(argv[1], &fs1) < 0 || stat(argv[2], &fs2) < 0) {
    perror("stat");
    return -2;
  }

  diff_minutes = (fs2.st_mtime - fs1.st_mtime) / 60;

  printf("%d\n", diff_minutes);
  return 0;
}
