function [ t, x1, x2 ] = pk( w1, w2, h)
    p=20/h;

    x1(1)=w1;
    x2(1)=w2;

    beta=[55/24,-59/24,37/24,-9/24];
    betag=[251/720,646/720,-264/720,106/720,-19/720];
    tic;
    for i = 1:3
        k11 = f1(x1(i),x2(i));
        k12 = f2(x1(i),x2(i));
        k21 = f1(x1(i) + 0.5*h*k11, x2(i) + 0.5*h*k12);
        k22 = f2(x1(i) + 0.5*h*k11, x2(i) + 0.5*h*k12);
        k31 = f1(x1(i) + 0.5*h*k21, x2(i) + 0.5*h*k22);
        k32 = f2(x1(i) + 0.5*h*k21, x2(i) + 0.5*h*k22);
        k41 = f1(x1(i) + h*k31, x2(i) + h*k32);
        k42 = f2(x1(i) + h*k31, x2(i) + h*k32);
        x1(i+1) = x1(i) + (1/6)*h*(k11 + 2*k21 + 2*k31 + k41);
        x2(i+1) = x2(i) + (1/6)*h*(k12 + 2*k22 + 2*k32 + k42);


    end

    for i=5:(p+1)
        suma1 = 0;
        suma2 = 0;
        for j =1:4
            suma1 = suma1 + beta(j)*f1(x1(i-j), x2(i-j));
            suma2 = suma2 + beta(j)*f2(x1(i-j), x2(i-j));
        end
        x10 = x1(i-1) + h*suma1;
        x20 = x2(i-1) + h*suma2;
        ff1 = f1(x10,x20);
        ff2 = f2(x10,x20);
        suma1 = 0;
        suma2 = 0;
        for j =1:3
            suma1 = suma1 + betag(j+1)*f1(x1(i-j), x2(i-j));
            suma2 = suma2 + betag(j+1)*f2(x1(i-j), x2(i-j));
        end
        x1(i) = x1(i-1) + h*suma1 + h*betag(1)*ff1;
        x2(i) = x2(i-1) + h*suma2 + h*betag(1)*ff2;

    end
    t = toc;
    [~,y] = ode45(@odefun, [0 15], [w1 w2]);

    plot(x1,x2);
    hold on;
    plot(y(:,1),y(:,2));
    hold off;


end