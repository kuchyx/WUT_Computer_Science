function [] = Zadanie2(STOPIEN)
    x = -5:1:5;
    x2 = -5:0.1:5;
    y = [-7.7743 -0.2235 1.9026 0.6572 0.1165 -1.8144 -1.0968 -0.8261 1.3327 6.1857 8.2891];
    x=x';
    y=y';
    a = najmnKwadratow(STOPIEN,x,y);
  
    eukNorm = euklidesNorm(a,y,x);
    czebNorm = czebyszewNorm(a,y,x);
    
    fprintf('B³¹d aproksymacji w normie Czebyszewa dla równania rzêdu %d wynosi %d\n',STOPIEN,czebNorm);
    fprintf('B³¹d aproksymacji w normie Euklidesowej dla równania rzêdu %d wynosi %d\n',STOPIEN,eukNorm);
    
    %Rysowanie wykresu
    scatter(x,y,'filled')
    hold on
    p = polyval(a,x2);
    plot(x2,p);
    grid;
    title('Aproksymacja przy stopniu równym 10 - równania normalne');
    xlabel('x');
    ylabel('y');
    legend('Punkty oryginalne','funkcja aproksymuj¹ca')
end