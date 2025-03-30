#ifndef BASE16_H
#define BASE16_H

void b16encode(const char *input, int input_len, char *output, int *output_len);
void b16decode(const char *input, int input_len, char *output, int *output_len);

#endif