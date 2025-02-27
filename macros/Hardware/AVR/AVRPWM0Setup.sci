// Copyright (C) 2017 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in

function AVRPWM0Setup(waveform_mode,output_mode)
//Function to Setup OC0 pin for required PWM mode
//
//Parameters
//	waveform_mode: integer, from 0 to 2
//      output_mode: integer, from 0 to 1 (or 2) depending on the waveform_mode
//    
//Description
//	Every Micro controller has PWM pins which can generate varying voltages
//	from 0V-5V.This function helps to use OC0 pin to produce required 
//	output waveform by setting the waveform mode and otput mode.
//
//	waveform_mode can take values-
//	<itemizedlist>
//      <listitem><para>0   -> for Phase correct PWM Mode</para></listitem>
//      <listitem><para>1   -> for Fast PWM Mode</para></listitem>
//      <listitem><para>2   -> for CTC Mode</para></listitem>
//      </itemizedlist>
//
//	output_mode can take values-
//      <itemizedlist>
//      For Phase correct PWM Mode:
//	<listitem><para>0 for Clear OC0 on compare match when up-counting. Set OC0 on compare match when down-counting.</para></listitem>
//	<listitem><para>1 for Set OC0 on compare match when up-counting. Clear OC0 on compare match when down-counting.</para></listitem>
//      For Fast PWM Mode:
//	<listitem><para>0 for non-inverted output i.e Clear OC0 on compare match, set OC0 at BOTTOM.</para></listitem>
//	<listitem><para>1 for inverted output i.e Set OC0 on compare match, clear OC0 at BOTTOM.</para></listitem>
//      For CTC Mode:
//	<listitem><para>0 to Clear OC0 on compare match</para></listitem>
//	<listitem><para>1 to Set OC0 on compare match</para></listitem>
//	<listitem><para>2 to toggle OC0 on compare match</para></listitem>
//      </itemizedlist>
//
// This is curretly dummy function. It provides no functionality but is required 
// for providing support for generating C code for AVR.
//
//Examples
//    AVRPWM0Setup(2,0);     //This function will select CTC waveform mode and will clear OC0 on compare match 
//See also
//     AVRPWM0SetDuty
//
//Authors
//     Ashish Kamble
//

if(waveform_mode>=3) then 
disp("Error : Invalid input argument ''waveform_mode'' in AVRPWM0Setup function.");
end
 
if((waveform_mode==0)|(waveform_mode==1)) then
 if(output_mode>=2) then 
 disp("Error : Invalid input argument ''output_mode'' in AVRPWM0Setup function.");
 end
end


if(waveform_mode==2) then
 if(output_mode>=3) then 
 disp("Error : Invalid input argument ''output_mode'' in AVRPWM0Setup function.");
 end
end

endfunction
