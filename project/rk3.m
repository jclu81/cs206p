clc;                                               % Clears the screen
clear all;

totalT = 100000;
k = 1;

figureN = 1;
for h = [0.01, 0.005, 0.001]
    x = 1;
    v = 0;
    n = totalT / h;
    t(1) = 0;
    energy(1) = 0.5;
    for i = 2 : n
        v1 = v;
        a1 = -k * x;
        v2 = v + h / 2 * a1;
        a2 = -k * (x + h / 2 * v1);
        v3 = v + h / 2 * a2;
        a3 = -k * (x + h / 2 * v2);
        v4 = v + h * a3;
        a4 = -k * (x + h * v3);
        x = x + h / 6 * ( v1 + 2 * v2 + 2 * v3 + v4);
        v = v + h / 6 * ( a1 + 2 * a2 + 2 * a3 + a4);
        t(i) = t(i - 1) + h;
        energy(i) = 0.5 * v * v + 0.5 * x * x;
    end
    subplot(1,3,figureN);
    plot(t,energy);
    xlabel('t');ylabel('energy');
    str=['h=',num2str(h)];
    title(str);
    figureN = 1+figureN;
end
