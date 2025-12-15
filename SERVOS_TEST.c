#include <xc.h>
#include <stdint.h>
#include "SERVOS_MODULE.h"
#include "PIC32INI.h"  // If you have global initializations here

int sumando = 1; // Controls the direction of the servo's movement

// ? Timer 3 Interrupt
__attribute__((vector(20), interrupt(IPL5SOFT), nomips16))
void InterrupcionT3(void) {
    IFS0bits.T5IF = 0; // Clear interrupt flag

    if (sumando) {
        sumAngulo(30); // Increase the angle by 10°
    } else {
        sumAngulo(-30); // Decrease the angle by 10°
    }

    // Change direction upon reaching the ends
    if (getGrados() == 90) {
        sumando = 0;
    } else if (getGrados() == -90) {
        sumando = 1;
    }
}

int main(void) {
    // Configure pins RC0-RC3 as digital
    ANSELC &= ~0xF;
    LATC |= 0xF;

    // Initialize servo
    inicializacionServo();

    // Configure Timer3
    T5CON = 0;
    TMR5 = 0;
    PR5 = 39062; // ~500ms if PBCLK = 5 MHz and prescaler = 64
    T5CON = 0x8070; // ON, prescaler 1:64

    // Configure Timer3 interrupt
    IPC5bits.T5IP = 3;  // Priority
    IPC5bits.T5IS = 0;  // Subpriority
    IFS0bits.T5IF = 0;  // Clear flag
    IEC0bits.T5IE = 1;  // Enable interrupt

    // Enable global interrupts
    INTCONbits.MVEC = 1;
    asm("ei");

    while (1) {
        // The servo movement is managed by interrupt.
    }

    return 0;
}
