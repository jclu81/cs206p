clc;                                               % Clears the screen
clear all;

totalT = 1000;
k = 1;

figureN = 1;
for h = [0.01, 0.005, 0.001]
    x = 1;
    v = 0;
    n = totalT / h;
    t(1) = 0;
    energy(1) = 0.5;
    for i = 2 : n
        a = single(-k * x);
        x = single(x + v * h);
        v = single(v + a * h);
        energy(i) = 0.5 * v * v + 0.5 * k * x * x;
        t(i) = t(i - 1) + h;
    end
    subplot(1,3,figureN);
    plot(t,energy);
    xlabel('t');ylabel('energy');
    str=['h=',num2str(h)];
    title(str);
    figureN = 1+figureN;
end
