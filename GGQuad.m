function S = GGQuad(f,n)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Funkcja znajdująca wartość całki z funkcji e^{-x}*f(x)*g_n(x), określonej
% na przedziale [0,inf], gdzie g_n(x) to n-ty wielomian z bazy wielomianów
% Laguerre'a (numerowanej od 1). Do obliczenia funkcji używana jest
% 10-punktowa kwadratura Gaussa-Laguerre'a.
% Wejście:
%   f    - Uchwyt do funkcji f(x). Funkcja jest zdefiniowana wektorowo.
%   n    - Liczba całkowita wskazująca, który wielomian z bazy wielomianów
%        - Laguerre'a zostanie przyjęty jako g_n(x).
% Wyjście:
%   S    - Wartość całki przybliżonej zastosowaną kwadraturą.

% Wektory węzłów i współczynnków dla 10-punktowej kwadratury
% Gaussa-Laguerre'a
nodes = [1.3779347054049243083e-01
    7.2945454950317049816e-01
    1.8083429017403160482e+00
    3.4014336978548995145e+00
    5.5524961400638036324e+00
    8.3301527467644967002e+00
    1.1843785837900065565e+01
    1.6279257831378102100e+01
    2.1996585811980761951e+01
    2.9920697012273891560e+01];
coef = [3.0844111576502014155e-01
    4.0111992915527355152e-01
    2.1806828761180942159e-01
    6.2087456098677747393e-02
    9.5015169751811005538e-03
    7.5300838858753877546e-04
    2.8259233495995655674e-05
    4.2493139849626863726e-07
    1.8395648239796307809e-09
    9.9118272196090085584e-13];

% Znalezienie wartości danego wielomianu z bazy dla węzłów kwadratury
% przy pomocy algorytmu Clenshawa
L = zeros(n,1);
L(n) = 1;
g = Clenshaw(L,nodes);

% Wykonanie wzoru 10-punktowej kwadratury Gaussa-Laguerre'a
S = sum(coef.*f(nodes).*g);
end