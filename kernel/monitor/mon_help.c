#include <kernel/monitor.h>
#include <kernel/console.h>
#include <kernel/klib.h>
#include <kernel/types.h>

int mon_help(int argc, char **argv) {
	uint32_t i = 0;
	(void) argc;
	(void) argv;
	for (i = 0; i < COMMAND_COUNT; i++) {
		kprintf("%s - %s\n", commands[i].name, commands[i].description);
    }
	return 0;
}