clc;                                               % Clears the screen
clear all;
k = 1;
s = ones(1,3);
h=0.01;
for totalT = [10000000];
%     figureN=1;
%     for h = [0.01]
        x_e = 1;
        x_lf = 1;
        x_rk = 1;
        v_e = 0;
        v_lf = 0;
        v_rk = 0;
        t(1) = 0;
        n = totalT / h;
        
        energyEuler(1) = 0.5;
        energyLf(1) = 0.5;
        energyRk(1) = 0.5;

        a_lf = single(- k * x_lf);
        v_lf = single(v_lf + 1/2 *h * a_lf);
        for i = 2 : n
            %1
            if s(1)==1
                a_e = single(-k * x_e);
                x_e = single(x_e + v_e * h);
                v_e = single(v_e + a_e * h);
                energyEuler(i) = 0.5 * v_e * v_e + 0.5 * k * x_e * x_e;
            end
            %2
            if s(2)==1
                x_lf = single(x_lf + v_lf * h);
                a_lf = single(-k * x_lf);
                v_lf = single(v_lf + a_lf * h); 
                energyLf(i) = 0.5 * v_lf * v_lf + 0.5 * k * x_lf * x_lf;
            end
            %3
            if s(3)==1
                v_1 = v_rk;
                a_1 = -k * x_rk;
                v_2 = v_rk + h / 2 * a_1;
                a_2 = -k * (x_rk + h / 2 * v_1);
                v_3 = v_rk + h / 2 * a_2;
                a_3 = -k * (x_rk + h / 2 * v_2);
                v_4 = v_rk + h * a_3;
                a_4 = -k * (x_rk + h * v_3);
                x_rk = x_rk + h / 6 * ( v_1 + 2 * v_2 + 2 * v_3 + v_4);
                v_rk = v_rk + h / 6 * ( a_1 + 2 * a_2 + 2 * a_3 + a_4);
                energyRk(i) = 0.5 * v_rk * v_rk + 0.5 * x_rk * x_rk;
            end
            t(i) = t(i - 1) + h;
            if abs(max(energyEuler)-0.5)/0.5>1
                s(1)=0;
            end
            if abs(max(energyLf)-0.5)/0.5>1
                s(2)=0;
            end
            if abs(max(energyRk)-0.5)/0.5>1
                s(3)=0;
            end
            
            if(sum(s)<2)
                break;
            end
%         end
%     subplot(1,3,figureN);
%     plot(t,energyEuler);
%     xlabel('t');ylabel('energy');
%     str=['h=',num2str(h)];
%     title(str);
%     figureN = 1+figureN;
        end
        if(sum(s)<2)
            break;
        end
end

