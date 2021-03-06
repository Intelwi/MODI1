%Michał Stolarz
%Projekt nr 2 MODI

%ZAD 2
%zrealizowano tutaj podpunkt d

koniec = 2000;
k = 1:koniec;
%ZAD D
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


%###########################################################
%rząd 
r = 4; %rząd dynamiki
r_w = 5; %stopień wielomianu

%###########################################################

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


no = 0
for k=r+1:P
    no=0
    for i=1:r
        for j=1:r_w
            
            no=no+1
            
            y_mod_arx(k) = y_mod_arx(k) + w(no)*Dane_ucz((r-(i-1)+k-(r+1)),1)^j + w(no+n)*Dane_ucz((r-(i-1)+k-(r+1)),2)^j;
            
            y_mod_arx_wer(k) = y_mod_arx_wer(k) + w(no)*Dane_wer((r-(i-1)+k-(r+1)),1)^j + w(no+n)*Dane_wer((r-(i-1)+k-(r+1)),2)^j;
            
            y_mod_oe(k) = y_mod_oe(k) + w(no)*Dane_ucz((r-(i-1)+k-(r+1)),1)^j + w(no+n)*y_mod_oe((r-(i-1)+k-(r+1)))^j;
            
            y_mod_oe_wer(k) = y_mod_oe_wer(k) + w(no)*Dane_wer((r-(i-1)+k-(r+1)),1)^j + w(no+n)*y_mod_oe_wer((r-(i-1)+k-(r+1)))^j;
            
        end
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
    subplot(2,1,1)
   hold on
   grid on
    plot(k,Y_wer,'red')
    plot(k,y_mod_arx_wer,'blue')
    plot(k,y_mod_oe_wer,'cyan')
   legend('y_{wer}(k)','y_{arx}(k)','y_{oe}(k)')
   set(gca,'FontSize',20)
   set(findall(gca, 'Type', 'Line'),'LineWidth',2);
    xlabel('k');
    ylabel('Amplituda');
  hold off
    
    subplot(2,1,2)
    hold on
    grid on
    plot(k,Y_ucz,'red')
    plot(k,y_mod_arx,'blue')
    plot(k,y_mod_oe,'cyan')
    legend('y_{ucz}(k)','y_{arx}(k)','y_{oe}(k)')
    set(gca,'FontSize',20)
    set(findall(gca, 'Type', 'Line'),'LineWidth',2);
    xlabel('k');
    ylabel('Amplituda');
   hold off
    
    