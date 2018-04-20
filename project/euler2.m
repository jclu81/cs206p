clc;                                               % Clears the screen
clear all;

totalT = 1000;
k = 1;

x(1) = 1;
v = 0;
h = 0.01;
t(1) = 0;
n = totalT / h;
error(1) = 0;
for i = 2 : n
    a = single(-k * x(i - 1));
    x(i) = single(x(i - 1) + v * h);
    v = single(v + a * h);
    t(i) = t(i - 1) + h;
    error(i) = abs(cos(t(i)) - x(i));
end
plot(t, error);
xlabel('t');ylabel('error');
