/* Copyright (C) 2016 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Mushir
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
*/

#include "statMax.h"

void i16rowmaxa(int16 *in, int rows, int columns, int16* out) {
  int i = 0, j = 0;

  for (i = 0; i < columns; i++) {
	  out[i]=(int16)in[i*rows];
	  for (j = 1 ; j < rows ; j++)
     		 if (in[i*rows+j]>out[i])
                     out[i] = (int16)in[i*rows+j];
    }
}
