/* Copyright (C) 2016 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Siddhesh Wani
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
*/

#include "addition.h"

void u16adda(uint16* in1, int size1, uint16* in2, int size2, uint16* out) {
  int i = 0;
  for (i = 0; i < size1 && i < size2; ++i) {
    out[i] = u16adds(in1[i], in2[i]);
  }
}
