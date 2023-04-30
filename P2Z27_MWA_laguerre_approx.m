function FL = P2Z27_MWA_laguerre_approx(f,m)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Aproksymacja średniokwadratowa ciągła w przestrzeni V, funkcji
% całkowalnych z kwadratem na przedziale (0,inf), z funkcją wagową 
% w(x) = e^(-x) w bazie wielomianów Laguerre'a. Całkowanie zostanie 
% wykonane 10-punktową kwadraturą Gaussa-Laguerre'a.
% Wejście:
%   f    - Uchwyt do przybliżanej funkcji należącej do przestrzeni V.
%        - Funkcja jest zdefiniowana wektorowo.
%   m    - Liczba całkowita reprentująca wymiar podprzestrzeni 
%        - rozpinanej przez bazę wielomanów Laguerre'a wielkości m,
%        - względem której przybliżamy funkcję f.
% Wyjście:
%   FL   - Wektor rozmiaru 1 na m, reprentujący współrzędne elementu
%        - optymalnego dla f w bazie wielomianów Lauguerre'a zadanego 
%        - rozmiaru m.

% Wyliczenie wektora iloczynów wektorowych <f,g_i>, przy pomocy algorytmu
% Clenshawa
S = zeros(m,1);
for i = 1:m
    S(i) = GGQuad(f,i);
end
% Dzielenie przez normy wielomianów z bazy, gdzie ||g_i|| == (i!)^2
d = factorial(0:m-1).^2;
FL = S./(d');
end
