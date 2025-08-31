#include <kernel/debug.h>
#include <kernel/monitor.h>
#include <kernel/console.h>
#include <kernel/klib.h>
#include <lib/base16.h>
#include <lib/string.h>
#include <kernel/proc.h>
#include <kernel/kalloc.h>
#include <kernel/system.h>
#include <kernel/types.h>


int mon_execute(int argc, char **argv) {
	struct Process *proc = NULL;
	int program_index = 0;
	bool loaded = false;
	if (argc < 2) {
		kprintf("execute requires at least one argument.\n");
		return -1;
	}
	program_index = argv[1][0] - '0';
	proc = proc_create();
	loaded = proc_load_program(proc, program_index);
	if (loaded) {
		schedule();
    } else {
		kprintf("couldn't load the process.\n");
	}
	return 0;
}