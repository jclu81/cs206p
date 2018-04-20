import numpy as np
import math

alpha = np.float64(2.37e-7);

def computeX(x0,n):
    xn = x0;
    for n in range(0, n):
        xn = math.pow(xn,2);
    return xn;

def computeY(y0,n):
    yn = y0;
    for n in range(0, n):
        yn = math.sqrt(yn);
    return yn;

def exp1():
    x0 = 1 + alpha;
    t = 1 + alpha;
    for n in range(1, 31):
        xn = computeX(x0,n);
        errx = xn - t;
        y0 = xn;
        yn = computeY(y0,n);
        erry = yn - t;
        print("n: ",n,"; errx: ",errx,"; erry: ",erry);
    return 0;

def exp2():
    y0 = 1 + alpha;
    t = 1 + alpha;
    for n in range(1, 31):
        yn = computeY(y0, n);
        erry = yn - t;
        x0 = yn;
        xn = computeX(x0,n);
        errx = xn - t;
        print("n: ",n,"; errx: ",errx,"; erry: ",erry);
    return 0;

exp1();
exp2();
