function e = PrintPols(n,ord,m,a,doPrint)
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test badający błąd metody dla wielomianów kolejnych rzędów, dla węzłów z
% przedziału [0,a].
X = (linspace(0,a,m))';

Funs = cell(n,1);
Funs{1} = @(x) 1;
for i = 2:n
    Funs{i} = @(x) x.^(i-1);
end
delts = zeros(1,n);
for i = 1:n
    FL = P2Z27_MWA_laguerre_approx(Funs{i},ord);
    Fa = Clenshaw(FL,X);
    F = Funs{i}(X);
    delts(i) = FindMSErr(F,Fa);
end
num = 0:n-1;
tab = [num;delts];
if doPrint
    fprintf("w(x) = x^%-2d  %e\n",tab);
end
e = delts;
end

