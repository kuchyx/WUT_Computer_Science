function [ t, x1, x2] = rk4(w1, w2, h) 
    x1(1) = w1;
    x2(1) = w2;
    
    p = 15/h;

    tic
    for i=1:p
                
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
        

    end
    t = toc;
    [~,y] = ode45(@odefun, [0 15], [w1 w2]);

    plot(x1,x2);
    hold on;
    plot(y(:,1),y(:,2));
    hold off;
    

end