#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int M = 10000;
// global storage for temporary result
int* f;
// use int to avoid numerical issues
int fib(int n) {
  if (n == 0 || n == 1) 
    return (int) 1.0;
  int a = (f[n-1] != 0) ? f[n-1] : fib(n-1);
  int b = (f[n-2] != 0) ? f[n-2] : fib(n-2);
  f[n] = (a + b) % M;
  return f[n];
}

int main(int argc, char *argv[]) {
  if (argc <= 1) {
    fprintf(stderr, "usage: %s [n]\n", argv[0]);
    exit(1);
  }
  
  int n = atoi(argv[1]);
  if (n <= 0) {
    fprintf(stderr, "Bad value: n should not be less than or equal to 0\n");
    exit(1);
  }
  f = (int *) malloc(sizeof(int) * (n+1));
  memset(f, 0, sizeof(int) * (n+1)); 
  int r = fib(n);
  printf("Result: %d\n", r);

  return 0;
}
