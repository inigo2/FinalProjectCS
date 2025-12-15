#include <xc.h>
#include <stdint.h>

// Initializes the ADC to read the X-axis of the joystick (AN0 / RA0)
void initADC() {
    ANSELAbits.ANSA0 = 1;
    TRISAbits.TRISA0 = 1;

    AD1CON1bits.FORM = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.ASAM = 0;

    AD1CHSbits.CH0SA = 0;
    AD1CON3bits.ADCS = 2;
    AD1CON3bits.SAMC = 10;

    AD1CON2 = 0;
    AD1CON1bits.ADON = 1;
}

// Read analog joystick value (0 to 1023)
uint16_t leerPotenciometro() {
    AD1CON1bits.SAMP = 1;
    while (!AD1CON1bits.DONE);
    return ADC1BUF0;
}

// Returns -1 if angle needs to be subtracted, 1 if angle needs to be added, 0 if it is not touched
// Returns -1 if joystick is fully to the left,
// 1 if it is completely to the right,
// and 0 if it is in a neutral or intermediate position.
int8_t adcToGrados(uint16_t adc_val) {
    if (adc_val < 100) {
        return -1; // Only if it is completely to the left
    } else if (adc_val > 920) {
        return 1; // Only if it's completely to the right
    } else{
        return 0;
    }
}

