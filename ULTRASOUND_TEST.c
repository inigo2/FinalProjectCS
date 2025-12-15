#include <xc.h>
#include <stdint.h>
#include <stdio.h>
#include "HCSR04.h"
#include "UART.h"
#include "MOTOR.h"
#include "DELAYS.h"


#define PBCLK 5000000  // Peripheral Bus Clock a 5 MHz

void iniLaser(void) {
    TRISB &= ~(1 << 14);
    ANSELB &= ~(1 << 14);
    LATB |= (1 << 14);
}

int main() {
    uint16_t distance;

    U1STAbits.UTXEN = 0;
    U1STAbits.UTXEN = 1;


    initHC_SR04();
    initUART();
    initMotor();
    iniLaser();
    

    while (1) {



        distance = getDistance();

        // Motor speed control based on distance
        uint16_t speed;
        if (distance < 200) {
            speed = 180; // Low speed if the target is nearby
        } else if (distance < 300) {
            speed = 220; // Average speed
        } else {
            speed = 255; // Maximum speed if the target is far away
        }

        controlMotor(speed);

        // Send distance and speed via UART
        char buffer[40];
        sprintf(buffer, "Distancia: %d cm, Motor: %d\r\n", distance, speed);
        sendString(buffer);

        delay_ms(500);
    }
}

// Implementation of delay with Timer1 based on 5 MHz PBCLK

