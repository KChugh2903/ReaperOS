USER_CC = arm-none-eabi-gcc
USER_CFLAGS = -mcpu=arm1176jz-s -marm -g0 \
         -std=c99 -pedantic -Wall -Wextra -msoft-float -fPIC -mapcs-frame \
         -fno-builtin-printf -fno-builtin-strcpy -nostdinc -nostdlib \
         -Iinclude

OBJS += usr/user_programs.o
USER_PROGRAMS = usr/shell \
		usr/hello \
		usr/fork_test \
		usr/exec_test \
		usr/concurrency_test
EXTRA_CLEAN += $(USER_PROGRAMS) usr/base16 usr/user_programs.c

usr/%: usr/%.c lib/libreaperos.a
	$(USER_CC) $(USER_CFLAGS) -c -o $@.o $<
	$(LD) -Ttext=100 $@.o lib/libreaperos.a -o $@
	rm -f $@.o

usr/base16: usr/base16.c
	gcc $< -o $@

usr/user_programs.c: usr/base16 $(USER_PROGRAMS)
	rm -f $@
	echo "const char *user_programs[][1024] = {" >> $@
	for program in $(USER_PROGRAMS); do \
		usr/base16 < $$program >> $@; \
	done
	echo "{0}};" >> $@