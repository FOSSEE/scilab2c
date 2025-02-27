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
 
 
#ifndef __CMD_DIGITAL_OUT_H__
#define __CMD_DIGITAL_OUT_H__
 
#include "types.h"

#ifdef  __cplusplus
extern "C" {
#endif
	
void u8cmd_digital_outs(uint8 board_no, uint8 pin, uint8 value);

#ifdef  __cplusplus
} /* extern "C" */
#endif

#endif /* __CMD_DIGITAL_OUT_H__ */
