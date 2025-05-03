#ifndef SENSORS_H
#define SENSORS_H

void init_peripherals();
float read_temperature();
void send_uart_alert(const char* msg);

#endif
