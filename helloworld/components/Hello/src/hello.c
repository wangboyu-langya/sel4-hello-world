/* apps/helloworld/components/Hello/src/hello.c */

#include <camkes.h>
#include <stdio.h>

void inf__init(void) {
}

void inf_print(const char *message) {
  printf("Client says: %s\n", message);
}
