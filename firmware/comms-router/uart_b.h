#ifndef UART_B_H
#define UART_B_H

#include "packets.h"

void bank_b_uart_init(SerialDriver* seriald);

bool get_packet_bank_b(packet *pkt);
bool send_packet_bank_b(packet *pkt);

#endif