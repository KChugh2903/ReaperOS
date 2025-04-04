#ifndef CONSOLE_H
#define CONSOLE_H

#include <types.h>

#define MAX_SPECIAL_KEY_SEQ_LEN 6
#define SPECIAL_KEY_COUNT 6

enum SpecialKey {
    SPECIAL_KEYS_START = 0x1000,
	KEY_ARROW_UP,
	KEY_ARROW_DOWN,
	KEY_ARROW_RIGHT,
	KEY_ARROW_LEFT,
	KEY_BACKSPACE
};

struct SpecialKeySequence {
    enum SpecialKey code;
    char sequence[MAX_SPECIAL_KEY_SEQ_LEN];
};

static const struct SpecialKeySequence SPECIAL_KEY_SEQUENCES[] = {
    {KEY_ARROW_UP,    {0x1b, 0x5b, 0x41, 0x00}},
	{KEY_ARROW_DOWN,  {0x1b, 0x5b, 0x42, 0x00}},
	{KEY_ARROW_RIGHT, {0x1b, 0x5b, 0x43, 0x00}},
	{KEY_ARROW_LEFT,  {0x1b, 0x5b, 0x44, 0x00}},
	{KEY_BACKSPACE,   {0x7f, 0x00}},
	{KEY_BACKSPACE,   {0x08, 0x00}}
};

void console_init(void);
void kputch(int c);
int kgetch(void);

void uart_init(void);
void uart_transmit(char c);
bool uart_can_receive(void);
int uart_receive(void);

int syscall_putch(int c);
int syscall_getch(void);

#endif