/* Copyright (C) 2016 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Brijesh Gupta C R
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
*/

#include <stdio.h>
#include <stdlib.h>
#include <isreal.h>
#include "doubleComplex.h"

char zisequals(doubleComplex inp1, doubleComplex inp2)
{
    if ((zreals(inp1) == zreals(inp2)) && (zimags(inp1) == zimags(inp2)))
        return 'T';
    else
        return 'F';
}

