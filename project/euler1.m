clc;                                               % Clears the screen
clear all;

totalT = 1;
k = 1;

for n = 1 : 1000
    deltaT(n) =single(totalT / n);
    x = 1;
    v = 0;
    for i = 1 : n
        a = single(-k * x);
        x = single(x + v * deltaT(n));
        v = single(v + a * deltaT(n));
    end
    error(n) = abs(cos(totalT) - x);
end

plot(log(deltaT), log(error));
xlabel('log(deltaT)');ylabel('log(error)');
p = polyfit(log(deltaT), log(error),1);
p(1)