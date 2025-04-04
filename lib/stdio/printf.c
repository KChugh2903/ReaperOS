#include <lib/stdio.h>
#include <lib/syscall.h>

int printf_base(void (*putch)(int), const char *format, ...) {
	int length = 0;
	char buffer[BUFFER_MAX_LENGTH];
	int i = 0;
	va_list ap;
	va_start(ap, format);
	length = vsprintf(buffer, format, ap);
	va_end(ap);
	while (buffer[i] != '\0') {
		putch(buffer[i]);
		i++;
	}
	return length;
}