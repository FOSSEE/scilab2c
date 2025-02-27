/* Copyright (C) 2016 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Ashish Kamble
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
*/ 
//Function to Set Duty cycle of PWM Output generated by Timer0 at OC0 pin.


#include "AVRPeripheralPWM.h"

uint8 u8AVRPWM0SetDutys(uint8 duty)
{
 uint8 duty_value = 0;
 duty_value = (((uint16)(duty * 0xff))/100);
 OCR0 = duty_value;
 return 0;
}

