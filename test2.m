function test2()
% Projekt 2, zadanie 27
% Mikołaj Wałachowski, 320748
%
% Test badający badający dokładność 10 funkcji GGQuad, porównując wartość
% całki policzoną 10-kwadraturą Gaussa z jej dokładną wartością policzoną
% analitycznie.
m = 6;
F = cell(1,m);
L = [1,3,1,1,1,1];
Sd = [7,0,32659.2,6402373705728000,...
    121645100408832000,2432902008176640000];
Sa = zeros(1,m);

F{1} = @(x) x.^3 + 1;
F{2} = @(x) 1 + x*0;
F{3} = @(x) 1/100*(x.^10 - x.^9);
F{4} = @(x) x.^18;
F{5} = @(x) x.^19;
F{6} = @(x) x.^20;


Fstr = ["e^(-x)*(x^3 + 1)","e^(-x)*1/6*(" + ...
    "-x^3 + 9*x^2 - 18*x + 6)","e^(-x)*1/100*(x^10 - x^9)",...
    "e^(-x)*(x^18)","e^(-x)*(x^19)","e^(-x)*(x^20)"];


for i = 1:m
    Sa(i) = GGQuad(F{i},L(i));
end
E = abs(Sa - Sd);

fprintf("Test spradzający dokładność funkcji GGQuad, " + ...
    "porównując wartość\ncałki policzoną 10-kwadraturą Gaussa z jej " + ...
    "dokładną wartością policzoną\nanalitycznie. Rozważane " + ...
    "będą jedynie wyrażenia z funkcją wagową e^(-x).\n" + ...
    "Zgodnie z rzędem kwadratury powinna być ona dokładna\ndla " + ...
    "wielomianów co najwyżej 19 stopnia.\n");
for j = 1:m
    pause;
    fprintf("\nCałkowanie na przedziale [0,inf],\nwyrażenia %s.\n",Fstr(j));
    fprintf("\nWynik dokładny: %e\nWynik przybliżony: %e\n" + ...
        "Błąd bezwzględny: %e\n",Sd(j),Sa(j),E(j));
end
end

