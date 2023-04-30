function test3()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test badający błąd metody dla wielomianów kolejnych rzędów, dla węzłów z
% przedziału [0,10].
n = 10;
ord = 11;
a = 10;
m = 10;

X = (linspace(0,a,m))';

Funs = cell(n,1);
Funs{1} = @(x) 1 + x*0;
for i = 2:n
    Funs{i} = @(x) x.^(i-1);
end

delts = zeros(1,n);
fprintf("Test badający zbieżności metody dla wielomianów kolejnych " + ...
    "stopni.\nPorównane zostaną dokładne wartości przybliżanej" + ...
    " funkcji,\nwartości przybliżone oraz ich błąd bezwzględny," + ...
    " dla\nkolejnych węzłów z przedziału [0,10]. Aproksymacja" + ...
    " będzie\nwykonana względem podprzestrzeni o rozmiarze 11.\n");
for i = 1:n
    pause;
    fprintf("\nWielomian: w(x) = x^%-2d\n",i-1);
    FL = P2Z27_MWA_laguerre_approx(Funs{i},ord);
    Fa = Clenshaw(FL,X);
    F = Funs{i}(X);
    delts(i) = FindMSErr(F,Fa);
    Err = abs(F-Fa);
    tab = [X';F';Fa';Err'];
    fprintf("  x \t wartość dokładna \t wartość przybliżona \t " + ...
        "błąd bezwzględny\n");
    fprintf("---------------------------------------------------" + ...
        "------------------\n");
    fprintf("%05.2f        %.2e             % .2e " + ...
        "            %.2e\n",tab);
    fprintf("Błąd śreniokwadratowy: %e\n",delts(i));
end
end

