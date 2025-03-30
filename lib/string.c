#include <lib/string.h>
#include <types.h>

/*
 * memcmp copies n bytes from the source buffer to the target buffer. It returns
 * the pointer to the target.
 */
void *memcpy(void *target, const void *source, size_t n) {
	char *target_buffer = (char *) target;
	char *source_buffer = (char *) source;
	size_t i = 0;
	for (i = 0; i < n; i++)
		target_buffer[i] = source_buffer[i];

	return target;
}


char *strcpy(char *target, const char *source) {
	char *result = target;
	while (*source) {
		*target = *source;
		target++;
		source++;
	}
	*target = '\0';
	return result;
}

size_t strlcpy(char *target, const char *source, size_t n) {
	size_t source_len = 0;
	size_t i = 0;
	while (i + 1 < n && source[i] != '\0') {
		target[i] = source[i];
		i++;
	}
	target[i] = '\0';
	source_len = strlen(source);
	return source_len;
}



int strcmp(const char *s1, const char *s2) {
	while (*s1 == *s2 && *s1 != '\0' && *s2 != '\0') {
		s1++;
		s2++;
	}

	return (*s1 - *s2);
}

int strncmp(const char *s1, const char *s2, size_t n) {
	size_t i = 0;
	if (n == 0) {
		return 0;
    }
	while (*s1 == *s2 && *s1 != '\0' && *s2 != '\0' && i < n - 1) {
		s1++;
		s2++;
		i++;
	}
	return (*s1 - *s2);	
}

char *strchr(const char *str, int character)
{
	while (*str != '\0' && *str != character)
		str++;

	if (*str == character)
		return (char *) str;
	else
		return NULL;
}

char *strtok(char *str, const char *delimiters) {
	static char *last = NULL;
	char *token = NULL;
	if (str != NULL) {
		last = str;
    }
	token = last;
	while (*token != '\0' && strchr(delimiters, *token) != NULL) {
		token++;
    }
	if (*token == '\0') {
		last = NULL;
		return NULL;
	}
	while (*last != '\0' && strchr(delimiters, *last) == NULL) {
		last++;
    }
	if (*last != '\0') {
		*last = '\0';
		last++;
	}
	return token;
}

/* memset fills the given target with given length with the given character. */
void *memset(void *target, int c, size_t len) {
	char *target_buffer = (char *) target;
	size_t i = 0;
	for (i = 0; i < len; i++) {
		target_buffer[i] = (char) c;
    }
	return target;
}

/* strlen returns the length of the given null-terminated string. */
size_t strlen(const char *str) {
	size_t length = 0;
	while (*str != '\0') {
		str++;
		length++;
	}
	return length;
}