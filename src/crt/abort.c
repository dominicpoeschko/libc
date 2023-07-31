#include <errno.h>
#include <stdlib.h>

__attribute__((weak, noreturn)) void abort(void)
{
    while(1){
        __asm__("bkpt 255");
    }
}
