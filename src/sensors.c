#include "sensors.h"

// Dummy implementations for CI / QEMU
void init_peripherals(void) {
    // Simulated peripherals init (no-op)
}

float read_temperature(void) {
    return 36.5;  // Normal simulated temp
}
