#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "HCSR04.h"
#include "UART.h"
#include "MOTOR.h"
#include "HCSR04.h"
#include "DELAYS.h"
#include "POTENTIOMETER.h"

#define PBCLK 5000000
#define BOTON_DISPARO PORTBbits.RB5

#define LASER_ON()  LATBbits.LATB14 = 1
#define LASER_OFF() LATBbits.LATB14 = 0

typedef enum {
    AUTOMATICO,
    MANUAL
} ModoSistema;

typedef enum {
    GIRANDO,
    ESPERANDO_DISPARO,
    RETOMANDO
} EstadoSistema;

ModoSistema modo = AUTOMATICO;
EstadoSistema estado = GIRANDO;

int grados_actual = -90;
int grados_anterior = -90;
int distancia = 0;


// ------------------ Laser initialization ------------------

void iniLaser(void) {
    TRISB &= ~(1 << 14); //rb14 SALIDA
    ANSELB &= ~(1 << 14);
    LASER_OFF();
}

// ------------------ Read UART until line is received ------------------

void leerComandoUART(char* buffer, uint8_t maxLen) {
    uint8_t i = 0;
    char c;
    while (i < maxLen - 1) {
        c = recibirChar();
        if (c == '\n' || c == '\r') break;
        buffer[i++] = c;
    }
    buffer[i] = '\0';
}

// ------------------ Firing state ------------------

void manejarDisparo() {
    LASER_ON();
    uint8_t anterior = 1;
    uint8_t actual;

    while (1) {
        actual = BOTON_DISPARO;

        if (anterior == 1 && actual == 0) {
            sendString("Disparo detectado. Abriendo barrera...\r\n");
            activarBarrera();
            delay_ms(800); // time to allow passage of the projectile
            cerrarBarrera();
            LASER_OFF();
            delay_ms(300);
            break;
        }

        anterior = actual;
        delay_ms(10);
    }
}

int main(void) {
    initHC_SR04();
    initUART();
    initMotor();
    inicializacionServo();
    initADC();
    iniLaser();

    TRISB |= (1 << 5); // Trigger button as input
    ANSELB &= ~(1 << 5); // Digital

    sendString("Sistema iniciado. Modo: AUTOMATICO\r\n");
    grados_actual = -90;
    setGrados(grados_actual);

    char comando[20];

    while (1) {
        // Check if a command arrived via UART
        if (UARTDisponible()) {
            leerComandoUART(comando, sizeof (comando));

            if (strcmp(comando, "manual") == 0) {
                modo = MANUAL;
                sendString("Cambiado a modo MANUAL\r\n");
            } else if (strcmp(comando, "automatico") == 0) {
                modo = AUTOMATICO;
                sendString("Cambiado a modo AUTOMATICO\r\n");
            } else {
                sendString("Comando no reconocido: ");
                sendString(comando);
                sendString("\r\n");
            }
        }

        if (modo == AUTOMATICO) {
            switch (estado) {
                case GIRANDO:
                    grados_anterior = grados_actual;
                    grados_actual += 30;
                    if (grados_actual > 90) grados_actual = -90;

                    int delta = grados_actual - grados_anterior;
                    sumAngulo(delta);
                    delayServoPorAngulo(abs(delta));

                    distancia = getDistance();

                    char buffer[60];
                    sprintf(buffer, "Grados: %d, Distancia: %d cm\r\n", grados_actual, distancia);
                    sendString(buffer);

                    uint16_t velocidad;
                    if (distancia < 80) {
                        velocidad = 255;
                    } else if (distancia < 1000) {
                        velocidad = 255;
                    } else {
                        velocidad = 255;
                    }

                    controlMotor(velocidad);
                    sprintf(buffer, "Velocidad motor: %d\r\n", velocidad);
                    sendString(buffer);

                    if (distancia < 5) {
                        estado = ESPERANDO_DISPARO;
                        sendString("Objetivo detectado. Esperando boton...\r\n");
                    }

                    break;

                case ESPERANDO_DISPARO:
                    manejarDisparo();
                    estado = RETOMANDO;
                    break;

                case RETOMANDO:
                    sendString("Reanudando búsqueda...\r\n");
                    delay_ms(500);
                    estado = GIRANDO;
                    break;
            }

        } else if (modo == MANUAL) {
            uint16_t adc_val = leerPotenciometro();
            int8_t direccion = adcToGrados(adc_val);

            if (direccion == -1) {
                sumAngulo(5); // Move to the right
            } else if (direccion == 1) {
                sumAngulo(-5); // Move to the left
            } else if (direccion == 0) {
                sumAngulo(0);
            }

            // Optional: delay to prevent very fast movements
            delay_ms(100);


            // Monitor trigger button
            static uint8_t boton_prev = 1;
            uint8_t boton_now = BOTON_DISPARO;
            if (boton_prev == 1 && boton_now == 0) {
                sendString("Disparo manual\r\n");
                manejarDisparo();
            }
            boton_prev = boton_now;
        }
    }

    return 0;
}
