
import math
E = 1e-20
TIME_MAX = 100000

def genfun():
    def funpow2(x):
        return math.pow(x,2)
    def funpow3(x):
        return math.pow(x,3)
    def funcosp1(x):
        return math.cos(x)+1
    return (funpow2, funpow3, funcosp1)

def gendfun():
    def funpow2(x):
        return 2*x
    def funpow3(x):
        return 3*math.pow(x,2)
    def funcosp1(x):
        return -1*math.sin(x)
    return (funpow2, funpow3, funcosp1)

def genddfun():
    def funpow2(x):
        return 2

    def funpow3(x):
        return 6 * x

    def funcosp1(x):
        return -1 * math.cos(x)

    return (funpow2, funpow3, funcosp1)

def calM(x0,f,fp,ffp):
    a= pow(fp(x0),2)
    b=f(x0) * ffp(x0)
    m=a/(a-b)
    return m

def my_zero(x0,f,fp,ffp,calM):
    x0= float(x0)
    time=0
    m = calM(x0, f, fp, ffp)

    while time<=TIME_MAX:
        #print m
        time += 1
        x1 = x0 - ((m * f(x0))/fp(x0))
        if abs(x1-x0)<E or abs(f(x1))<E:
            return x1, time, m

        x0 = x1
        m = calM(x0, f, fp, ffp)

    return x0, time, m


if __name__ == "__main__":
    for i in range(3):
        zero, time, m = my_zero(1.0, genfun()[i], gendfun()[i], genddfun()[i], calM)
        print "For Funtion %s:\t The zero of x occurs at x= %f \tLoop %d times \t m= %f" % (genfun()[i].__name__, zero, time, m)
