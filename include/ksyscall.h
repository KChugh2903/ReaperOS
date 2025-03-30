#ifndef KSYSCALL_H
#define KSYSCALL_H

#include <lib/syscall.h>

int handle_syscall(enum SystemCallCode code, int arg1, int arg2, int arg3);

#endif