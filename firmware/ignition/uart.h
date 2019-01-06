#ifndef UART_H
#define UART_H

#include "packets.h"

void uart_init(SerialDriver* seriald);

bool get_packet(packet *pkt);
bool send_packet(packet *pkt);

#endif