#ifndef CHECKSUM_H
#define CHECKSUM_H

#include "packets.h"

bool is_valid(packet *pkt);
uint32_t fletcher_32(packet *pkt);

#endif