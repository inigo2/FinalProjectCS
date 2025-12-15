#include <xc.h>
#include <stdint.h>
#include "PIC32INI.h"

// Clear pin definitions
#define PIN_PULSADOR     5   // RB5
#define PIN_PWM_MOTOR_A  8   // RC7 (PWM Output)
#define PIN_DIR_MOTOR_A  9   // RC6 (Steering)
#define PERIODO          249 // For PWM with a 50us period

int main(void) {

    int pulsador_ant, pulsador_act;
    int factor_servicio = 0; // Initial PWM duty cycle (0%)

    // Analog/digital configuration
    ANSELB &= ~(1 << PIN_PULSADOR); // Pushbutton as digital
    ANSELC &= ~((1 << PIN_PWM_MOTOR_A) | (1 << PIN_DIR_MOTOR_A)); // Digital motor pins

    // Output configuration
    TRISB |= (1 << PIN_PULSADOR); // RB5 as input (push button)
    TRISC &= ~((1 << PIN_PWM_MOTOR_A) | (1 << PIN_DIR_MOTOR_A)); // RC6 and RC7 as outputs

    // Output initialization
    LATC &= ~((1 << PIN_PWM_MOTOR_A) | (1 << PIN_DIR_MOTOR_A)); // Motor pins initially set to 0

    // Unlock apps to configure outputs
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    RPC8R = 0x05; 
    SYSKEY = 0x1CA11CA1; // Block PPS

    // PWM configuration (OC1 using Timer2)
    OC2CON = 0;
    OC2R = 0; // Initial pulse value (off)
    OC2RS = 0; // Initially off
    OC2CON = 0x8006; // PWM ON, standard PWM mode

    // Timer2 Configuration
    T2CON = 0;
    TMR2 = 0;
    PR2 = PERIODO; // PWM period 50us
    T2CON = 0x8000; // Timer2 ON, prescaler 1:1
    
    // Initial reading of the push button
    pulsador_ant = (PORTB >> PIN_PULSADOR) & 1;
    
    while (1) {

        // Reading the current push button
        pulsador_act = (PORTB >> PIN_PULSADOR) & 1;

        // Detect falling edge (pulse)
        if ((pulsador_act != pulsador_ant) && (pulsador_act == 0)) {

            factor_servicio += 10; // Increases the useful cycle by 10%

            if (factor_servicio > 100) {
                factor_servicio = 0; // Returns to 0% when exceeding 100%
            }

            OC2RS = (factor_servicio * PERIODO) / 100; // Update PWM
        }

        pulsador_ant = pulsador_act; // Update previous state
    }
}

