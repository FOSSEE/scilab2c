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

#include <math.h>
#include "floor.h"

void u8floora(uint8* x, int size, uint8* out) {
	int i = 0;
	for (i=0;i<size;i++) out[i] = u8floors(x[i]);
}
