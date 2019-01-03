#ifndef UART_A_H
#define UART_A_H

#include "packets.h"

void bank_a_uart_init(SerialDriver* seriald);

bool get_packet_bank_a(packet *pkt);
bool send_packet_bank_a(packet *pkt);

#endif