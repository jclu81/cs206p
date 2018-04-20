
import math
E = 1e-20
TIME_MAX = 100000

def genfun():
    def funsin(x):
        return math.sin(x)
    def funcos(x):
        return math.cos(x)
    def funtan(x):
        return math.tan(x)
    def funlog(x):
        return math.log(x)
    def funpow2(x):
        return math.pow(x,2)
    def funpow3(x):
        return math.pow(x,3)
    def funcosp1(x):
        return math.cos(x)+1
    return (funsin, funcos, funtan,
    funlog, funpow2, funpow3, funcosp1)

def gendfun():
    def funsin(x):
        return math.cos(x)
    def funcos(x):
        return -1.0 * math.sin(x)
    def funtan(x):
        return 1/math.pow(math.cos(x),2)
    def funlog(x):
        return 1/x
    def funpow2(x):
        return 2*x
    def funpow3(x):
        return 3*math.pow(x,2)
    def funcosp1(x):
        return -1*math.sin(x)
    return (funsin, funcos, funtan,
    funlog, funpow2, funpow3, funcosp1)

def my_zero(x0,f,fp,sc=2):
    x0= float(x0)
    time=0

    issc1 = False if sc==1 else True
    while issc1 or time<=TIME_MAX:
        time += 1
        x1 = x0 - f(x0)/fp(x0)
        if sc==2 and abs(x1-x0)<E:
            return x1, time
        if sc==3 and abs(f(x1))<E:
            return x1, time
        if time>TIME_MAX:
            return x1, time
        x0 = x1

    return x0, time

if __name__ == "__main__":
    # Q3
    # for i in range(6):
    #     for sc in range(1,4):
    #         zero, time = my_zero(1.0, genfun()[i], gendfun()[i],sc)
    #         print "For Funtion %s and Stop Criterion %d:\t The zero of x occurs at x= %f \tLoop %d times" % (genfun()[i].__name__, sc, zero, time)


    zero, time = my_zero(1.0, genfun()[6], gendfun()[6], 2)
    print "For Funtion %s and Stop Criterion %d:\t The zero of x occurs at x= %f \tLoop %d times" % (genfun()[6].__name__, 2, zero, time)
