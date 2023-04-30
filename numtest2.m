function numtest2()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Funkcja wykreślająca na wykresie zależność błędu średniokwadratowego
% aproksymacji dla kolejnych rzędów aproksymacji oraz stopni wielomianów
% postaci x^n dla 10-punktowej kwadratury.
close all
mord = 21;
m = 200;
n = 21;
a = 10;
delts1 = zeros(n,mord);
for ord = 1:mord
    delts1(:,ord) = PrintPols(n,ord,m,a,false);
end
n = n -1;
[A,B] = meshgrid(1:mord,0:n);
surf(A,B,delts1);
c = parula;
c = flipud(c);
colormap(c);
title("Zależność błędu \delta dla aproksymacji wielomianów x^n")
xlabel("rząd aproksymacji (m)")
ylabel("stopień wielomianu (n)")
xlim([1 mord]);
ylim([0 n]);
clim([1e-15 1e+15]);
set(gca,'ColorScale','log')
view(2)
colorbar;
end


