function FL = laguerre_approx40(f,m)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Funkcja analogiczna do głównej funkcji, używająca 40-punktowej
% kwadratury.
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
    S(i) = GGQuad40(f,i);
end
% Dzielenie przez normy wielomianów z bazy, gdzie ||g_i|| == (i!)^2
d = factorial(0:m-1).^2;
FL = S./(d');
end
