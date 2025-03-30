#ifndef KLIB_H
#define KLIB_H

#include <lib/stdio.h>
#include <console.h>

#define kgets(buffer) gets_base(kgetch, kputch, buffer)
#define kprintf(...) printf_base(kputch, ##__VA_ARGS__)

#endif