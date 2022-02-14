#define _GNU_SOURCE
#define CAML_INTERNALS

#include <string.h>
#include <stdio.h>
#include "caml/misc.h"

CAMLexport char * caml_strerror(int errnum, char * buf, size_t buflen)
{
#if defined(__GLIBC__) /* GNU variant */
    return strerror_r(errnum, buf, buflen);
#elif defined(_WIN32)  /* Windows has a thread-safe strerror */
    return strerror(errnum);
#else                  /* POSIX variant */
    int res = strerror_r(errnum, buf, buflen);
    /* glibc<2.13 returns -1/sets errno, >2.13 returns +ve errno.
       We cannot get ERANGE since buffer size is large enough, so
       only possible error is EINVAL. */
    if (res != 0) {
        snprintf(buf, buflen, "Unknown error %d", errnum);
    }
    return buf;
#endif
}
