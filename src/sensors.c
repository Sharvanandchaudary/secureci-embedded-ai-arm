#include "sensors.h"
#include <string.h>
#include <unistd.h>

void init_peripherals(void) {
    // No real hardware init
}

float read_temperature(void) {
    return 36.5; // Simulated temperature
}

void send_uart_alert(const char *msg) {
    write(1, msg, strlen(msg));  // write to UART/STDOUT
}
