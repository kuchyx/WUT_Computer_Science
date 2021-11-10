%Zadanie1
clear; 
%Generowanie wykresu funkcji aby sprawdzic poprwanosc otrzymanych rozwiazan 
x  = -5: .1 : 5;
plot(x, fun(x), 'b','LineWidth', 2)
grid on
axis([-5 5 -150 50])
hold on;
plot([-1 -1], [-150 50],'r-');
plot([1.1 1.1], [-150 50],'r-');
plot([1.9 1.9], [-150 50],'g-');
plot([4 4], [-150 50],'g-');
plot(0.2397479765971350,0,'.','MarkerSize',24,'MarkerEdge','k');
plot(2.8270409098836571,0,'.','MarkerSize',24,'MarkerEdge','k');

n=100; 
x1 = -1; 
x2 = 0; 

%wyznaczanie przedzialow izolacji na podstawie skryptu MNUM
for k=1:2
    for j=1:n
        if fun(x1)*fun(x2)<0
            a = x1;
            b = x2;
            fprintf('Wyniki dla %d miejsca zerowego w przedziale [%d,%d]\n',k,a,b);
            bisection('fun',a,b,100);
            %secant('fun',a,b,100);
            %newton('fun',a,100);
            x1 = 3; 
            x2 = 4; 
            break;
        elseif abs(fun(x1))<abs(fun(x2))
            x1 = x1+1.1*(x1-x2);
        else
            x2 = x2+1.1*(x2-x1);
        end
        if(x1>5)&&(x2<(-5))
            break; %wyjscie z petli po przekroczeniu przedzialu
        end
    end
end
