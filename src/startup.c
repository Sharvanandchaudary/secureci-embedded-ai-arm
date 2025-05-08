#include <stdint.h>

extern uint32_t _estack;
extern int main(void);

// These MUST match real types
void Reset_Handler(void);
void Default_Handler(void);

// Reset Handler — with proper signature
void Reset_Handler(void) {
    extern uint32_t _sidata, _sdata, _edata;
    extern uint32_t _sbss, _ebss;

    // Copy .data from FLASH to RAM
    uint32_t *src = &_sidata;
    uint32_t *dst = &_sdata;
    while (dst < &_edata) {
        *dst++ = *src++;
    }

    // Zero .bss
    dst = &_sbss;
    while (dst < &_ebss) {
        *dst++ = 0;
    }

    main();
    while (1);
}

// Default Handler
void Default_Handler(void) {
    while (1);
}

// ✅ Vector Table — fully typed, no warnings
__attribute__((section(".isr_vector")))
const void (* const vector_table[])(void) = {
    (void (*)(void)) &_estack,       // Initial stack pointer (cast to match type)
    Reset_Handler,                   // Reset Handler
    Default_Handler,                 // NMI
    Default_Handler                  // HardFault
};
