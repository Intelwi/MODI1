%Michał Stolarz
%Projekt nr 2 MODI

%ZAD 2
%zrealizowano tutaj podpunkt f
%parametry wyliczono w arkuszu kalkulacyjnym zad2_f.ods

f=@(u,y) (-0.0866)*u + (-0.0028)*u.^2 + (-0.2015)*u.^3 + (-0.0943)*u.^4 + (-0.0515)*y + (0)*y.^2 + (-0.0001)*y.^3 + (0)*y.^4 

fimplicit(f,[-8 8 -8 8])
