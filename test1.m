function test1()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test badający badający zbieżność algorytmu Clenshawa dla zadania 
% obliczenia wartości kolejnych wielomianów z bazy Laguerre'a.
m = 10;
LP = cell(m,1);
LP{1} = @(x) 1;
LP{2} = @(x) 1 - x;
for i = 3:m
    LP{i} = @(x) (2*i - 3 - x).*LP{i - 1}(x) - (i - 2)^2*LP{i - 2}(x);
end
X = linspace(-100,100,5)';
F1 = zeros(length(X),m);
F2 = zeros(length(X),m);

FL = zeros(m,1);
for j = 1:m
    FL(j) = 1;
    F1(:,j) = Clenshaw(FL,X);
    FL(j) = 0;

    F2(:,j) = LP{j}(X);
end

fprintf("Test badający badający zbieżność algorytmu Clenshawa" + ...
    "\ndla zadania obliczenia wartości kolejnych wielomianów z " + ...
    "bazy\nLaguerre'a, porównane zostaną wartości wielomianów" + ...
    " wyliczone\nstandardowym wzorem rekurencyjnym, a także " + ...
    "algorytmem Clenshawa.\n");
for k = 1:m
    pause;
    fprintf("\nPorównanie wartości %d-tego wielomianu " + ...
        "Laguerre'a,\npoliczonych według standardowego wzoru\n" + ...
        "rekurencyjnego - L1(x) oraz algorytmu Clenshawa - L2(x),\n" + ...
        "a także ich błędu bezwzględnego - E(x).\n",k);
    fprintf("   x         L1(x)           L2(x)           " + ...
        "E(x)\n");
    fprintf("-----------------------------------------------------\n");
    Err = abs(F1 - F2);
    tab = [X';F2(:,k)';F1(:,k)';Err(:,k)'];
    fprintf("%-5d \t %+2e \t %+2e \t %e\n",tab);
end
