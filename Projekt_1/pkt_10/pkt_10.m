syms Tp u_c s
K=2
T1=3
T2=11
a1=-0.84
a2=-0.03
a3=-1.95
a4=-0.9
A=[-(T1+T2)/T1*T2 1 ; -1/(T1*T2) 0]
B = [0 ; K*(a1+2*a2*u_c+3*a3*u_c^2+4*a4*u_c^3)/(T1*T2)]
C = [1 0]
D=0


G = C*(inv(eye(2)*s - A))*B + D

K = limit(G,s,0)

K = symfun(K,u_c);
figure(1)
fplot(K,[-1,1])
xlabel('u');
ylabel('K(u)');