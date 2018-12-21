#ifndef USBSERIAL_H
#define USBSERIAL_H

void usbserial_init(void);
void usbserial_send(uint8_t* data, size_t len);

#endif