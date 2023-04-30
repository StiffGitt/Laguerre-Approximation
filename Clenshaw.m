function F = Clenshaw(FL,X)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Funkcja licząca w punktach z wektora X, wartości funkcji o współrzędnych
% w bazie wielomianów Laguerre'a zapisanych w wektorze FL, przy
% wykorzystaniu algorytmu Clenshawa.
% Wejście:
%   FL   - Współrzędne funkcji w bazie wielomianów Laguerre'a.
%   X    - Wektor węzłów, w których zostanie wyliczona wartość funkcji.
% Wyjście:
%   S    - Wektor wartości funkcji w węzłąch z X.

% Zdefiniowanie początkowych wartości wykorzystywanych w algorytmie
n = length(FL);
B1 = FL(n)*ones(length(X),1); % B_{k+1}
B2 = zeros(length(X),1); % B_{k+2}

% Wykonanie algorytmu rekurencyjnego Clenshawa
for k = (n-1):-1:1
    Bp = B1;
    B1 = FL(k) + (-1*X - (1 - 2*k)).*B1 - k^2*B2;
    B2 = Bp;
end
% Obliczenie wartości funkcji na podstawie wyliczonego wyrazu ciągu
F = B1;
end

