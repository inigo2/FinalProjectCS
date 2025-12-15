#ifndef MOTOR_H
#define MOTOR_H

#include <stdint.h>

void initMotor();            // Engine initialization
void controlMotor(uint16_t speed);  // Adjust the motor speed (0-255)

#endif
