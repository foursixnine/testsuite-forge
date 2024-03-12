#include <stdio.h>
#include <stdlib.h>
#include <qrencode.h>

int main(int argc, char *argv[]) {
    QRcode *qrcode;
    const char *text = "Hello, World!";
    qrcode = QRcode_encodeString(text, 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if(qrcode == NULL) {
        perror("QRcode_encodeString");
        exit(EXIT_FAILURE);
    }

    for(int y = 0; y < qrcode->width; y++) {
        for(int x = 0; x < qrcode->width; x++) {
            if(qrcode->data[y*qrcode->width + x] & 0x01) {
                printf("##");
            } else {
                printf("  ");
            }
        }
        printf("\n");
    }

    QRcode_free(qrcode);
    return 0;
}
