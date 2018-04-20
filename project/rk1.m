clc;                                               % Clears the screen
clear all;

totalT = 1;
k = 1;

for n = 1 : 1000
    deltaT(n) =single(totalT / n);
    x = 1;
    v = 0;
    for i = 1 : n
        v_1 = v;
        a_1 = -k * x;
        
        v_2 = v + 0.5 * deltaT(n) * a_1;
        a_2 = -k * (x + deltaT(n) / 2 * v_1);
        
        v_3 = v + deltaT(n) / 2 * a_2;
        a_3 = -k * (x + deltaT(n) / 2 * v_2);
        
        v_4 = v + deltaT(n) * a_3;
        a_4 = -k * (x + deltaT(n) * v_3);
        
        x = x + deltaT(n) / 6 * ( v_1 + 2 * v_2 + 2 * v_3 + v_4);
        v = v + deltaT(n) / 6 * ( a_1 + 2 * a_2 + 2 * a_3 + a_4);
    end 
    error(n) = abs(cos(totalT) - x);
end

x=log(deltaT);
y=log(error);
plot(x,y);
xlabel('log(deltaT)');ylabel('log(error)');
index = find(x>-3);
p = polyfit(x(index), y(index),1);
p(1)
