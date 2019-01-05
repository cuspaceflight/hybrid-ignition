#ifndef CHECKSUM_H
#define CHECKSUM_H

#include "packets.h"

uint32_t fletcher_32(packet *pkt);

#endif