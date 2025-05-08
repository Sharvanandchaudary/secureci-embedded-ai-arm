#include "sensors.c"
#include <stdio.h>

int main(void) {
    init_peripherals();

    float temp = read_temperature();
    if (temp > 40.0) {
        send_uart_alert("⚠️ High Temperature Detected!\n");
    } else {
        send_uart_alert("✅ Temperature Normal\n");
    }

    while (1);
    return 0;
}
