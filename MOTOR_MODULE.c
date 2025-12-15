#include <xc.h>
#include "MOTOR.h"

#define PBCLK 5000000   // Peripheral Bus Clock a 5 MHz
#define MOTOR_PWM OC2RS // PWM output for the motor

void initMotor() {
    // ---- REMAPPING ----
    // Unlock system logs for PPS
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;

    RPC8R = 0x05;

    SYSKEY = 0x1CA11CA1; // Lock records again

    // Timer2 configuration to generate PWM at 20 kHz with PBCLK = 5 MHz
    T2CON = 0;
    TMR2 = 0;
    PR2 = (PBCLK / 20000) - 1; // PR3 = 249 for 20 kHz
    T2CON = 0X8000;

    // Configure PWM in OC2
    OC2CON = 224;
    OC2RS = 0;
    OC2CON = 0x8006;
}

void controlMotor(uint16_t speed) {
    if (speed > 255) {
        speed = 255;
    }
    MOTOR_PWM = (speed * (PR2 + 1)) / 255;
}
