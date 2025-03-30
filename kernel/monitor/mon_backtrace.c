#include <monitor.h>
#include <console.h>
#include <debug.h>
#include <klib.h>
#include <system.h>
#include <types.h>

static void print_args(struct DebugInfo *info, int *fp);

int mon_backtrace(int argc, char **argv) {
    int *fp = NULL;
    int pc = 0;
    (void) argc;
    (void) argv;
    while (fp != NULL) {
        int lr = fp[-1];
        struct DebugInfo info = get_debug_info(pc);
        if ((int) fp == lr) {
            break;
        }
        kprintf("  fp: %x, lr: %x\n", fp, lr);
		kprintf("    %s:%s:%d\n", info.file, info.function,
			info.source_line_number);
        if (info.arg_count != 0) {
            print_args(&info, fp);
        }
        pc = lr;
        fp = (int *) fp[-3];
    }
    return 0;
}

static void print_args(struct DebugInfo *info, int *fp) {
    int arg_index = 0;
    kprintf("   arguments: ");
    for (arg_index = 0; arg_index < info->arg_count; arg_index++) {
        char *arg_name = info->arg_names[arg_index];
        int arg_pos = info->arg_positions[arg_index];
        int arg_value = fp[arg_pos >> 2];
        kprintf("%s=%d ", arg_name, arg_value);
    }
    kprintf("\n");
}
