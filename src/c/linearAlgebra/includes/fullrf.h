 /* Copyright (C) 2017 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Sandeep Gupta
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
 */
#ifndef __FULLRF_H__
#define __FULLRF_H__
#include "types.h"

#ifdef  __cplusplus
extern "C" {
#endif

double dfullrfa(int ninp,double *in1,int row,int col,double tol,double *out1,double *out2);

#ifdef  __cplusplus 
} /* extern "C" */
#endif

#endif /*__FULLRF_H__*/
