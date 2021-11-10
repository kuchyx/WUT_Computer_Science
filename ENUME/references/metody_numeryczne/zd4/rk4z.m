function [ t, x1, x2] = rk4z(w1, w2, h)
    x1(1) = w1;
    x2(1) = w2;
    a = 0;
    x = a;
    b = 20;
    s = 0.9;
    p = 4;
    pp = 15/h;
    
    epsb = eps(1);
    epsn = 10e-7;

    x1(1) = w1;
    x2(1) = w2;

   
    tic
    for i=1:pp
                
        k11 = f1(x1(i), x2(i));
        k21 = f2(x1(i), x2(i));
        k12 = f1(x1(i)+1/2*h*k11 , x2(i)+1/2*k21*h);
        k22 = f2(x1(i)+1/2*h*k11 , x2(i)+1/2*k21*h);
        k13 = f1(x1(i)+1/2*h*k12 , x2(i)+1/2*h*k22);
        k23 = f2(x1(i)+1/2*h*k12 , x2(i)+1/2*h*k22);
        k14 = f1(x1(i)+h*k13 , x2(i)+h*k23);
        k24 = f2(x1(i)+h*k13 , x2(i)+h*k23);
        x1(i+1) = x1(i) + 1/6*h*(k11 +2*k12 + 2*k13 + k14);
        x2(i+1) = x2(i) + 1/6*h*(k21 +2*k22 + 2*k23 + k24);
        %krok?
        x1h = [x1(i) 0 0];
        x2h = [x2(i) 0 0];
        for j=1:2
            k11 = f1(x1h(j),x2h(j));
            k21 = f2(x1h(j),x2h(j));
            k12 = f1(x1h(j)+0.25*h*k11, x2h(j)+0.25*h*k21);
            k22 = f2(x1h(j)+0.25*h*k11, x2h(j)+0.25*h*k21);
            k13 = f1(x1h(j)+0.25*h*k12, x2h(j)+0.25*h*k22);
            k23 = f2(x1h(j)+0.25*h*k12, x2h(j)+0.25*h*k22);
            k14 = f1(x1h(j)+k13*h*0.5, x2h(j)+k23*h*0.5);
            k24 = f2(x1h(j)+k13*h*0.5, x2h(j)+k23*h*0.5);
            x1h(j+1) = x1h(j) + (1/12)*(k11+2*k12+2*k13+k14)*h;
            x2h(j+1) = x2h(j) + (1/12)*(k21+2*k22+2*k23+k24)*h;
        end
        dn_h1 = (x1(i+1) - x1h(j+1)) / (2^p - 1);
        dn_h2 = (x2(i+1) - x2h(j+1)) / (2^p - 1);
        eps_1 = abs(x1(i+1)) * epsn + epsb;
        eps_2 = abs(x2(i+1)) * epsn + epsb;
        alfa1 = (eps_1 / abs(dn_h1))^(1/(p+1));
        alfa2 = (eps_2 / abs(dn_h2))^(1/(p+1));
        if alfa1 > alfa2
            alfa = alfa2;
        else
            alfa = alfa1;
        end
        x = x+h;
        if(s*alfa >= 1)
            if(x >= b)
                break;
            else
                h = min([s*alfa*h 5*h b-x]);
            end
        else
            h = s * alfa * h; %dlugosc kroku dla nastepnej iteracji
        end
    end
    t = toc;
    [~,y] = ode45(@odefun, [0 15], [w1 w2]);

    plot(x1,x2);
    hold on;
    plot(y(:,1),y(:,2));
    hold off;

end