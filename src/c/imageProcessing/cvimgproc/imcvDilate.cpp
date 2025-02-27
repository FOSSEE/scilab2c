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

/* Function to adaptive threshold a gray scale image*/

#include "types.h"
#include "cvcore.hpp"
#include "cvimgproc.hpp"


using namespace cv;

Mat imcvDilate(Mat src, char* dilation_type, double size, double iterations, \
				char* border_type, double border_value)
{

	/*Mat dst(src.rows, src.cols, src.type());*/
	Mat dst = src.clone();
	int dilate_type =0;

	if(strcmp(dilation_type,"MORPH_RECT") == 0)
	{
		dilate_type = MORPH_RECT;
	}		
	else if(strcmp(dilation_type,"MORPH_CROSS") == 0)
	{
		dilate_type = MORPH_CROSS;
	}		
	else if(strcmp(dilation_type,"MORPH_ELLIPSE") == 0)
	{
		dilate_type = MORPH_ELLIPSE;
	}		


	Mat element = getStructuringElement(dilate_type, Size(size,size), \
					Point((size-1)/2,(size-1)/2));

	if(strcmp(border_type,"BORDER_REPLICATE") == 0)
	{
		dilate(src, dst, element, Point(-1,-1), iterations, BORDER_REPLICATE);
	}
	else if(strcmp(border_type,"BORDER_REFLECT"))
	{
		dilate(src, dst, element, Point(-1,-1), iterations, BORDER_REFLECT);
	}
	else if(strcmp(border_type,"BORDER_REFLECT_101"))
	{
		dilate(src, dst, element, Point(-1,-1), iterations,BORDER_REFLECT_101);
	}
	else if(strcmp(border_type,"BORDER_WRAP"))
	{
		dilate(src, dst, element, Point(-1,-1), iterations, BORDER_WRAP);
	}
	else if(strcmp(border_type,"BORDER_CONSTANT"))
	{
		dilate(src, dst, element, Point(-1,-1), iterations, BORDER_CONSTANT, \
				Scalar(border_value));
	}
	
	
	return dst;
}