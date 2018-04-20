clc;                                               % Clears the screen
clear all;

totalT = 1;
k = 1;

for n = 1 : 1000
    deltaT(n) =single(totalT / n);
    x = 1;
    v = 0;
    a = single(- k * x);
    v = single(v + 1/2 *deltaT(n) * a);
    for i = 1 : n
        x = single(x + v * deltaT(n));
        a = single(-k * x);
        v = single(v + a * deltaT(n)); 
    end
    error(n) = abs(cos(totalT) - x);
end

x=log(deltaT);
y=log(error);
plot(x,y);
xlabel('log(deltaT)');ylabel('log(error)');
index = find(x>-4);
p = polyfit(x(index), y(index),1);
p(1)

