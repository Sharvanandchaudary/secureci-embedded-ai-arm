#ifndef SENSORS_H
#define SENSORS_H

void init_peripherals(void);
float read_temperature(void);
void send_uart_alert(const char *msg);

#endif
