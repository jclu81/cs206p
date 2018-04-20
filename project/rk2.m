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
    v_1 = single(v);
    a_1 = single(-k * x(i - 1));
    v_2 = single(v + h / 2 * a_1);
    a_2 = single(-k * (x(i - 1) + h / 2 * v_1));
    v_3 = single(v + h / 2 * a_2);
    a_3 = single(-k * (x(i - 1) + h / 2 * v_2));
    v_4 = single(v + h * a_3);
    a_4 = single(-k * (x(i - 1) + h * v_3));
    x(i) = single(x(i - 1) + h / 6 * ( v_1 + 2 * v_2 + 2 * v_3 + v_4));
    v = single(v + h / 6 * ( a_1 + 2 * a_2 + 2 * a_3 + a_4));
    t(i) = t(i - 1) + h;
    error(i) = abs(cos(t(i)) - x(i));
end 
plot(t, error);
xlabel('t');ylabel('error');

