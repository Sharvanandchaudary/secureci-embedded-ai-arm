#include "sensors.h"
#include <unistd.h>
#include <string.h>

void send_uart_alert(const char *msg) {
    write(1, msg, strlen(msg));  // Write to STDOUT (QEMU will capture this)
}

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
