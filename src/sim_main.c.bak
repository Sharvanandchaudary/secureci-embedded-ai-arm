#include <stdio.h>

// Simulated sensor logic
float read_temperature() {
    return 42.0;  // Fake high temperature
}

void send_uart_alert(const char* msg) {
    printf("UART: %s", msg);
}

void init_peripherals() {
    printf("🛠️ Simulated hardware initialized.\n");
}

int main() {
    init_peripherals();
    float temp = read_temperature();
    if (temp > 40.0) {
        send_uart_alert("⚠️ High Temperature Detected!\n");
    } else {
        send_uart_alert("✅ Temperature Normal\n");
    }
    return 0;
}
