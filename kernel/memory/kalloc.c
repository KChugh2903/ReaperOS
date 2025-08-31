#include <kernel/kalloc.h>
#include <kernel/vm.h>
#include <kernel/types.h>

static struct PageList *page_list_prepend(struct PageList *page_list, char *page_addr);

static struct PageList *free_list_4k = NULL;
static struct PageList *free_list_1k = NULL;

void kalloc_init(uint32_t start, uint32_t end) {
    char *start_addr = (char*) ROUND_UP(start, PAGE_SIZE);
    char *end_addr = (char*) ROUND_DOWN(end, PAGE_SIZE);
    char *curr_page = NULL;
    free_list_4k = NULL;
    free_list_1k = NULL;
    for (curr_page = start_addr; curr_page != end_addr; curr_page += PAGE_SIZE) {
        free_list_4k = page_list_prepend(free_list_4k, curr_page);
    }
}

void *kalloc() {
    void *result = NULL;
    if (free_list_4k != NULL) {
        result = free_list_4k;
        free_list_4k = free_list_4k->next;
    }
    return result;
}

void *kalloc1k() {
    void *result = NULL;
    if (free_list_1k != NULL) {
        char *page = kalloc();
        if (page != NULL) {
            kfree1k(page);
            kfree1k(page + 0x400);
            kfree1k(page + 0x800);
            kfree1k(page + 0xC00);
        }
    }
    if (free_list_1k != NULL) {
        result = free_list_1k;
        free_list_1k = free_list_1k->next;
    }
    return result;
}

void kfree(void *page) {
    free_list_4k = page_list_prepend(free_list_4k, page);
}

void kfree1k(void *page) {
    free_list_1k = page_list_prepend(free_list_1k, page);
}

uint32_t get_free_memory_size(void) {
    uint32_t result = 0;
    struct PageList *curr_page = NULL;
    curr_page = free_list_1k;
    while (curr_page != NULL) {
        result += 0x400;
        curr_page = curr_page->next;
    }
    curr_page = free_list_1k;
    while (curr_page != NULL) {
        result += 0x1000;
        curr_page = curr_page->next;
    }
    return result;
}

static struct PageList *page_list_prepend(struct PageList *page_list, char *page_addr) {
    struct PageList *page = (struct PageList*) page_addr;
    page->next = page_list;
    return page;
}