%Charakterystyka statyczna nieliniowa i charakterystyka zlinearyzowana na
%tle nieliniowej

% u - zmienne
% a1, a2, a3, a4, K, u_c - stałe
syms u

a1 = -0.84
a2 = -0.03
a3 = -1.95
a4 = -0.9
K = 2

% pierwsza charakterystyka statyczna nieliniowa (jednowymiarowa)
y1 = symfun(K*(a1*u + a2*u^2 + a3*u^3 + a4*u^4),u);
figure(1)
fplot(y1,[-1,1])
xlabel('u');
ylabel('y(u)');



%jednowymiarowe statyczne charakterystyki zlinearyzowane dla trzech kolejnych punktów u_c=-0.5,
%u_c=1, u_c=0.5 , na tle charakterystyki nieliniowej
for v = -0.5:0.5:0.5
    u_c = v;
    
    %współczynniki do linearyzacji
    a = a1 + 2*a2*u_c + 3*a3*u_c^2 + 4*a4*u_c^3;
    b = -a2*u_c^2 - 2*a3*u_c^3 - 3*a4*u_c^4;
    
    y1_1 = symfun(K*(u*a + b),u);
    figure
    hold on
    fplot(y1,[-1,1])
    fplot(y1_1,[-1,1])
    xlabel('u');
    ylabel('y(u)');
    hold off
end