function numtest1()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test badający błąd metody dla wielomianów kolejnych rzędów, dla węzłów z
% przedziału [0,a].

m = 25;
n = 16;
a = 1;
for ord = 1:15
    fprintf("\nBaza wielkości: %d\n",ord);
    pause;
    fprintf("\nDla kwadratury 10-punktowej:\n");
    PrintPols(n,ord,m,a,true);
    pause;
    fprintf("\nDla kwadratury 40-punktowej:\n");
    PrintPols40(n,ord,m,a,true);
    pause;
end
end

