%Michał Stolarz
%Projekt nr 2 MODI

%ZAD 2
%zrealizowano tutaj podpunkty a, b, c

koniec = 2000;
k = 1:koniec;
%ZAD A,B,C
%pobranie danych uczących
fileID = fopen('danedynucz41.txt','r');
formatSpec = '%g';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A'

%wykres
X_ucz=A(1:end,1);
Y_ucz=A(1:end,2);
figure
hold on
plot(k,X_ucz,'blue')
plot(k,Y_ucz,'red')
legend('u(k)','y(k)')
title('Dane uczące')
xlabel('k');
ylabel('Amplituda');
hold off

%pobranie danych weryfikacyjnych
fileID = fopen('danedynwer41.txt','r');
formatSpec = '%g';
sizeA = [2 Inf];


A = fscanf(fileID,formatSpec,sizeA)
fclose(fileID);
A=A'

%wykres
X_wer=A(1:end,1);
Y_wer=A(1:end,2);
figure
hold on
plot(k,X_wer,'blue')
plot(k,Y_wer,'red')
legend('u(k)','y(k)')
title('Dane weryfikacyjne')
xlabel('k');
ylabel('Amplituda');
hold off



%rząd 
r = 1%rząd dynamiki
r_w = 1; %rząd wielomianu

Dane_ucz=[X_ucz, Y_ucz];
Dane_wer=[X_wer, Y_wer];
P=length(Dane_ucz);
Y_ucz_wy=Dane_ucz(r+1:P,2);

%Tworzenie uniwersalnej macierzy M
M=zeros(length(Dane_ucz)-r, 2*r*r_w);
for i=1:r
    for j=1:r_w
        M(:,r_w*i-r_w+j)=Dane_ucz((r-(i-1)):(P-i),1).^j;
        M(:,r_w*i-r_w+j+r*r_w)=Dane_ucz((r-(i-1)):(P-i),2).^j;
    end
end
w=M\Y_ucz_wy;
n=length(w)/2;

%rekurencja
y_mod_oe = zeros(P,1);
%bez rekurencji
y_mod_arx = zeros(P,1);
%rekurencja
y_mod_oe_wer = zeros(P,1);
%bez rekurencji
y_mod_arx_wer = zeros(P,1);

%tylko dla r_w=1
for k=r+1:P
    for m=1:r
        y_mod_oe(k)=y_mod_oe(k)+w(m)*Dane_ucz(k-m,1)+w(m+n)*y_mod_oe(k-m);%rekurencja dane ucz
        
        y_mod_oe_wer(k)=y_mod_oe_wer(k)+w(m)*Dane_wer(k-m,1)+w(m+n)*y_mod_oe_wer(k-m);%rekurencja dane wer
        
        y_mod_arx(k)=y_mod_arx(k)+w(m)*Dane_ucz(k-m,1)+w(m+n)*Dane_ucz(k-m,2);%nie rekurencja dane ucz
        
        y_mod_arx_wer(k)=y_mod_arx_wer(k)+w(m)*Dane_wer(k-m,1)+w(m+n)*Dane_wer(k-m,2);%nie rekurencja dane ucz
        
    end
end


%błąd bez rekurencji dla Dane_ucz
Err_biter_ucz=(norm(y_mod_arx(r+1:P)-Y_ucz(r+1:P)))^2

%bład z rekurencją dla Dane_ucz
Err_iter_ucz=(norm(y_mod_oe(r+1:P)-Y_ucz(r+1:P)))^2

%błąd bez rekurencji dla Dane_wer
Err_biter_wer=(norm(y_mod_arx_wer(r+1:P)-Y_wer(r+1:P)))^2

%bład z rekurencją dla Dane_wer
Err_iter_wer=(norm(y_mod_oe_wer(r+1:P)-Y_wer(r+1:P)))^2

k = 1:P;

%rysowanie wykresów dane uczace
    figure
    hold on
    plot(k,X_ucz,'cyan')
    plot(k,Y_ucz,'blue')
    plot(k,y_mod_arx,'red')
    legend('u_{ucz}(k)','y_{ucz}(k)','y_{arx}(k)')
    title('ARX')
    xlabel('k');
    ylabel('Amplituda');
    hold off
    
    figure
    hold on
    plot(k,X_ucz,'cyan')
    plot(k,Y_ucz,'blue')
    plot(k,y_mod_oe,'red')
    legend('u_{ucz}(k)','y_{ucz}(k)','y_{oe}(k)')
    title('OE')
    xlabel('k');
    ylabel('Amplituda');
    hold off
    
     %rysowanie wykresów dane weryfikacyjne
    figure
    hold on
    plot(k,X_wer,'cyan')
    plot(k,Y_wer,'blue')
    plot(k,y_mod_arx_wer,'red')
    legend('u_{wer}(k)','y_{wer}(k)','y_{arx}(k)')
    title('ARX')
    xlabel('k');
    ylabel('Amplituda');
    hold off
    
    figure
    hold on
    plot(k,X_wer,'cyan')
    plot(k,Y_wer,'blue')
    plot(k,y_mod_oe_wer,'red')
    legend('u_{wer}(k)','y_{wer}(k)','y_{oe}(k)')
    title('OE')
    xlabel('k');
    ylabel('Amplituda');
    hold 
