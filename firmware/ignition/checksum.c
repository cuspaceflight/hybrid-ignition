#include "ch.h"
#include "hal.h"

#include <string.h>

#include "packets.h"
#include "checksum.h"


/* Compute the Fletcher-32 Checksum for a Packet */
uint32_t fletcher_32(packet *pkt){
    
    int i;
    uint16_t ck_a = 0, ck_b = 0;
    const int n = sizeof(packet) - sizeof(uint32_t);
    uint8_t buf[n];

    memcpy(buf, pkt, n);

    for(i=0; i<n; i++) {
        ck_a += buf[i];
        ck_b += ck_a;
    }

    return (ck_b<<16) | (ck_a);
}