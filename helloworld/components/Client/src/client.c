/* apps/helloworld/components/Client/src/client.c */

#include <camkes.h>

int run(void) {
  const char *s = "hello world";
  iface_print(s);
  return 0;
}
