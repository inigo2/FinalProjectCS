#include <xc.h>
#include <stdint.h>
#include "HCSR04.h"
#include "PIC32INI.h"

#define PIN_TRIG LATCbits.LATC4  // TRIG in RC4
#define PIN_ECHO PORTCbits.RC5   // ECHO in RC5
#define PBCLK 5000000

void delay_ms1(uint16_t ms) {
    for (uint16_t i = 0; i < ms; i++) {
        T1CON = 0x8000; // Enable Timer1, prescaler 1:1
        TMR1 = 0;
        while (TMR1 < (PBCLK / 1000)); // Wait 1 ms (5000 cycles)
        T1CONbits.ON = 0; // Turn off Timer1
    }
}
void initHC_SR04() {
    // Configure TRIG as output (RC4), ECHO as input (RC5)
    TRISC &= ~(1 << 4); // RC4 as output (set bit 4 of TRISC to 0)
    TRISC |= (1 << 5); // RC5 as input (set bit 5 of TRISC to 1)

    // Configure Timer1
    T1CON = 0x0000; // Turn off Timer1
    TMR1 = 0; // Counter reset
    T1CONbits.TCKPS = 2; // Prescaler 1:64 (adjusted for precision)
}

uint16_t getDistance() {
    uint16_t time;

    // Generate a 10 µs pulse on TRIG
    PIN_TRIG = 0;
    delay_ms1(2);
    PIN_TRIG = 1;
    delay_ms1(10);
    PIN_TRIG = 0;

    // Wait until ECHO is high
    while (!PIN_ECHO);
    TMR1 = 0;
    T1CONbits.ON = 1;

    // Wait until ECHO goes back to low
    while (PIN_ECHO);
    T1CONbits.ON = 0;

    time = TMR1;

    // Convert time to distance in centimeters
    return (time / 58);
}
