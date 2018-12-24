#ifndef USBSERIAL_H
#define USBSERIAL_H

#include "packets.h"

void usbserial_init(void);

bool get_packet_usb(packet *pkt);
bool send_packet_usb(packet *pkt);

#endif