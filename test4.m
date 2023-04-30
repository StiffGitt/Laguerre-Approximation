function test4()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test porównujący zbieżność metody dla wybranych wielomianów w zależności 
% od dobranego rozmiaru podprzestrzeni wielomianów Laguerre'a,w której
% będzie wykonana aproksymacja.
n = 3;
a = 10;
m = 10;

X = (linspace(0,a,m))';

Funs = cell(1,n);
Funs{1} = @(x) 4*x.^3 + 3*x.^2 + 2*x + 1;
Funs{2} = @(x) 6*x.^6 + 4*x.^4 + 2*x.^2;
Funs{3} = @(x) 1/100*x.^9 + 1/10*x.^6 + x.^3 + 10;

Fstr = ["w(x) = 4*x^3 + 3*x.^2 + 2*x + 1","w(x) = 6*x^6 + 4*x^4 + " + ...
    "2*x^2","w(x) = 1/100*x^9 + 1/10*x^6 + x^3 + 10"];

fprintf("Test porównujący zbieżność metody dla wybranych wielomianów" + ...
    "\nw zależności od dobranego rozmiaru podprzestrzeni wielomianów" + ...
    " Laguerre'a,\nw której będzie wykonana aproksymacja. Zgodnie z" + ...
    " własnościami numerycznymi\nmetody, aproksymacja powinna być" + ...
    " dokładna dla rozmiaru większego niż\nstopnień wielomianu," + ...
    " przy założeniu, że jest on wystarczająco niski,\n" + ...
    "aby 10-punktowa kwadratura Gaussa-Laguerre'a była dokładna.\n")
pause;
for i = 1:n
    fprintf("\nWielomian: %s\n",Fstr(i));
    pause;
    delts = zeros(1,n);
    for ord = 1:10

        fprintf("\nRozmiar wykorzystanej bazy " + ...
            "wielomianów Laguerre'a: %d\n",ord);
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
        fprintf("błąd śreniokwadratowy: %e\n",delts(i));
        pause;
    end
end
end

