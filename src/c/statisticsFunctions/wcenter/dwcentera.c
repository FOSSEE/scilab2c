#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ones.h>
#include "subtraction.h"
#include "multiplication.h"
#include "wcenter.h"

void dwcentera (double* inp, int row, int col, double* out)
{
    double sum = 0, xbar = 0, sigma = 0;
    for(int i = 0; i < row*col; i++)		// Findinag the maen of all the elements of the matrix
        sum += inp[i];
    xbar = sum/(row*col);
    
    double one[row*col];			// Creating a matrix of ones
    donesa(one,row,col);

    double prod[row*col];
    for(int i = 0; i < row*col; i++)		// Applying the formula (x(i,j)-xbar)/sigma
        prod[i] = one[i]*xbar;

    for(int i = 0; i < row*col; i++)
        out[i] = inp[i] - prod[i];

    sum = 0;
    for(int i = 0; i < row*col; i++)
        sum =  sum + out[i]*out[i];

    sigma = sqrt(sum/(row*col-1));
    
    for(int i = 0; i < row*col; i++)
        out[i] = out[i]/sigma;
}
