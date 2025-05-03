#include <stdint.h>

// Declare main so the compiler knows it exists
extern int main(void);

// Stack size (1 KB)
static uint32_t stack[256];

// Forward declaration of the Reset handler
void Reset_Handler(void);

// Interrupt vector table placed at beginning of flash
__attribute__ ((section(".isr_vector")))
const void *vector_table[] = {
    (void *)((uint32_t)stack + sizeof(stack)), // Initial SP value
    Reset_Handler                              // Reset handler address
};

// The Reset handler: call main and loop forever
void Reset_Handler(void) {
    main();
    while (1);
}
