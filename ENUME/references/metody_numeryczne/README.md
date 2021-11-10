# Metody numeryczne

## Zadanie 1

### 1. Dokładność maszynowa
Proszę napisać program wyznaczający dokładność maszynową komputera i wyznaczyć ją na swoim komputerze.

### 2. Metoda Eliminacji Gaussa z częściowym wyborem elementu podstawowego 
Proszę napisać program rozwiązujący układ n równań liniowych Ax=b wykorzystując metodę Eliminacji Gaussa z częściowym wyborem elementu podstawowego. Proszę zastosować program do rozwiązania układów dla liczby równań n = 10, 20, 40 80, 160, .... Liczbę tych równań zwiększać aż do momentu, gdy czas potrzebny na rozwiązanie układu daje staje się zbyt duży lub metoda zawodzi.

### 3. Metoda Jacobiego
Proszę napisać program rozwiązujący układ n równań liniowych Ax=b wykorzystując metodę Jacobiego.

## Zadanie 4

Ruch punktu jest opisany równaniami:


![equation](http://latex.codecogs.com/gif.latex?%5C%5C%20x_1%5E%7B%27%7D%3Dx_2+x_1%280.5-x_1%5E2-x_2%5E2%29%5C%5C%20%5C%5C%20x_2%5E%7B%27%7D%3D-x_1+x_2%280.5-x_1%5E2-x_2%5E2%29)

Do rozwiązania zadania należy użyć zaimplementowanych przez siebie metod:
### 1. Rungego–Kutty czwartego rzędu (RK4) ze stałym krokiem. 
Proszę przy tym wykonać tyle prób (kilka – kilkanaście), ile będzie potrzebnych do znalezienia takiego kroku, którego zmniejszanie nie wpływa znacząco na rozwiązanie, podczas gdy zwiększanie – już wpływa;

### 2. Wielokrokowej predyktor–korektor Adamsa czwartego rzędu ze stałym krokiem
który należy dobrać w sposób podany dla metody z punktu 1; 

### 3. Rungego–Kutty czwartego rzędu (RK4) ze zmiennym krokiem. 
W każdym kroku należy szacować błąd aproksymacji.
