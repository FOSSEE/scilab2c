/* Copyright (C) 2016 - IIT Bombay - FOSSEE

 This file must be used under the terms of the CeCILL.
 This source file is licensed as described in the file COPYING, which
 you should have received as part of this distribution.  The terms
 are also available at
 http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt
 Author: Abhinav Dronamraju
 Organization: FOSSEE, IIT Bombay
 Email: toolbox@scilab.in
*/


#include "gsort.h"
#include "types.h"
#include "uint16.h"

void u16gsorta(uint16 *in, int size, char check, uint16* out)
{
    uint16 a; uint16 in_copy[size];

   for(int i=0; i< size; i++)

	{
		in_copy[i]= in[i];

        }


if(check == 'i')
{
    for (int i = 0; i < size; ++i)

    {

        for (int j = i + 1; j < size; ++j)

        {

            if (in_copy[i] > in_copy[j])

            {

                a =  in_copy[i];

                in_copy[i] = in_copy[j];

                in_copy[j] = a;

            }

        }

    }
}

if(check =='d')
{
 for (int i = 0; i < size; ++i)

    {

        for (int j = i + 1; j < size; ++j)

        {

           if (in_copy[i] < in_copy[j])

            {

                a =  in_copy[i];

                in_copy[i] = in_copy[j];

                in_copy[j] = a;

            }

        }

    }


}

   for(int i=0; i< size; i++)

	{
		out[i]= in_copy[i];

        }


}
