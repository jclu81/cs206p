
import math
E = 1e-64
TIME_MAX = 1000

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
    return (funsin, funcos, funtan,
    funlog, funpow2, funpow3)

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
    return (funsin, funcos, funtan,
    funlog, funpow2, funpow3)

def my_zero(x0,f,fp):
    x0= float(x0)
    time=0
    while True: #time<=TIME_MAX:
        time += 1
        x1 = x0 - f(x0)/fp(x0)
        if abs(x1-x0)<E:
            return x1, time
        else:
            x0 = x1
    return x0, time

if __name__ == "__main__":

    for i in range(6):
        zero, time = my_zero(1.0, genfun()[i], gendfun()[i])
        print "For funtion %s:\t The zero of x occurs at x= %f \tLoop %d times" % (genfun()[i].__name__, zero, time)
