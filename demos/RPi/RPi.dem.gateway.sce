// Copyright (C) 2017 - IIT Bombay - FOSSEE
//
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
// Author: Jorawar Singh, Sandeep Gupta
// Organization: FOSSEE, IIT Bombay
// Email: toolbox@scilab.in


subdemolist = ["Wait and Blink","test_wait_and_blink.dem.sce";
               "LCD","test_lcd.dem.sce"
              ];

global SCI2CHOME;
subdemolist(:,2) = SCI2CHOME + "/demos/RPi/"+ subdemolist(:,2);
