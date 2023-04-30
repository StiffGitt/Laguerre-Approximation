function delta = FindMSErr(F,Fa)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Funkcja znajdująca błąd średniokwadratowy dla wektora wartości funkcji F
% oraz wektora jej przybliżonych wartości Fa.

delta = sqrt(sum((F-Fa).^2)/length(F));
end

