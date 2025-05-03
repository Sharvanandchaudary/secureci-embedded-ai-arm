#include "sensors.h"
#include <stdio.h>

void init_peripherals() {
    // Initialize ADC, UART, etc.
    // Placeholder for STM32 HAL or bare-metal setup
}

float read_temperature() {
    // Simulate temp reading (in a real board, use ADC read)
    return 42.3;  // Simulated value
}

void send_uart_alert(const char* msg) {
    // In actual firmware, send over UART (e.g., HAL_UART_Transmit)
    printf("%s", msg);  // For simulation/QEMU output
}
