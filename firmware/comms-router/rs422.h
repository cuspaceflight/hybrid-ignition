#ifndef RS422_H
#define RS422_H

#include "packets.h"

void rs422_init(SerialDriver* seriald);

bool get_packet_rs422(packet *pkt);
bool send_packet_rs422(packet *pkt);

#endif