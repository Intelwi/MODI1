%Michał Stolarz
%Projekt nr 2 MODI

koniec = 2000;
k = 1:koniec;
%ZAD A
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
legend('x(k)','y(k)')
title('Dane uczące')
xlabel('k');
ylabel('y(x)');
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
legend('x(k)','y(k)')
title('Dane weryfikacyjne')
xlabel('k');
ylabel('y(x)');
hold off



%rząd 
r = 2

if(r == 1)
    
    %wyznaczenie modelu
    M = [X_ucz(1:end-r) Y_ucz(1:end-r)];
    w = M\Y_ucz(1+r:end);
   
    
    %dla danych uczacych
    
    %bez rekurencji
    Y_mod_arx = M*w;
    
    %z rekurencją
    Y_mod_oe = zeros(koniec,1);
    
    for i=1+r:1:koniec
        Y_mod_oe(i) = w(1)*X_ucz(i)+w(2)*Y_mod_oe(i-1);
    end
    
    %definicja  zmiennej
     Err_biter_ucz=0;
     Err_iter_ucz=0;
    
    for i = 1:1:koniec-1
        Err_biter_ucz = Err_biter_ucz+(Y_ucz(i+1) - Y_mod_arx(i))^2;
       
    end
    
    for i = 1+r:1:koniec
        Err_iter_ucz = Err_iter_ucz+(Y_ucz(i) - Y_mod_oe(i))^2;
    end
    
    %rysowanie wykresów
    figure
    hold on
    plot(k,Y_ucz,'blue')
    plot(k(1+r:end),Y_mod_arx,'red')
    legend('y_{ucz}(k)','y_{mod}(k)')
    title('Wersja bez iteracji')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    figure
    hold on
    plot(k,Y_ucz,'blue')
    plot(k,Y_mod_oe,'red')
    legend('y_{ucz}(k)','y_{mod}(k)')
    title('Wersja z iteracją')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    %dla danych weryfikujących
    
    %wyznaczenie macierzy
    M = [X_wer(1:(end-r)) Y_wer(1:(end-r))];
     
    %bez rekurencji
    Y_mod_arx = M*w;
    
    %z rekurencją
    Y_mod_oe = zeros(koniec,1);
    
    for i=1+r:1:koniec
        Y_mod_oe(i) = w(1)*X_wer(i)+w(2)*Y_mod_oe(i-1);
    end
    
    %definicja  zmiennej
     Err_biter_wer=0;
     Err_iter_wer=0;
    
    for i = 1:1:koniec-1
        Err_biter_wer = Err_biter_wer+(Y_wer(i+1) - Y_mod_arx(i))^2;
    end
    
    for i = 1+r:1:koniec
        Err_iter_wer = Err_iter_wer+(Y_wer(i) - Y_mod_oe(i))^2;
    end
    
    %rysowanie wykresów
    figure
    hold on
    plot(k,Y_wer,'blue')
    plot(k(1+r:end),Y_mod_arx,'red')
    legend('y_{wer}(k)','y_{mod}(k)')
    title('Wersja bez iteracji')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    figure
    hold on
    plot(k,Y_wer,'blue')
    plot(k,Y_mod_oe,'red')
    legend('y_{wer}(k)','y_{mod}(k)')
    title('Wersja z iteracją')
    xlabel('k');
    ylabel('y(x)');
    hold off
end

%##################################################################
%##################################################################

if(r == 2)
 %wyznaczenie modelu
    M = [X_ucz(2:end-1) X_ucz(1:end-2) Y_ucz(2:end-1) Y_ucz(1:end-2)];
    w = M\Y_ucz(1+r:end);
   
    
    %dla danych uczacych
    
    %bez rekurencji
    Y_mod_arx = M*w;
    
    %z rekurencją
    Y_mod_oe = zeros(koniec,1);
    
    for i=1+r:1:koniec
        Y_mod_oe(i) = w(1)*X_ucz(i)+w(2)*Y_mod_oe(i-1);
    end
    
    %definicja  zmiennej
     Err_biter_ucz=0;
     Err_iter_ucz=0;
    
    for i = 1:1:koniec-1
        Err_biter_ucz = Err_biter_ucz+(Y_ucz(i+1) - Y_mod_arx(i))^2;
       
    end
    
    for i = 1+r:1:koniec
        Err_iter_ucz = Err_iter_ucz+(Y_ucz(i) - Y_mod_oe(i))^2;
    end
    
    %rysowanie wykresów
    figure
    hold on
    plot(k,Y_ucz,'blue')
    plot(k(1+r:end),Y_mod_arx,'red')
    legend('y_{ucz}(k)','y_{mod}(k)')
    title('Wersja bez iteracji')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    figure
    hold on
    plot(k,Y_ucz,'blue')
    plot(k,Y_mod_oe,'red')
    legend('y_{ucz}(k)','y_{mod}(k)')
    title('Wersja z iteracją')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    %dla danych weryfikujących
    
    %wyznaczenie macierzy
    M = [X_wer(1:(end-r)) Y_wer(1:(end-r))];
     
    %bez rekurencji
    Y_mod_arx = M*w;
    
    %z rekurencją
    Y_mod_oe = zeros(koniec,1);
    
    for i=1+r:1:koniec
        Y_mod_oe(i) = w(1)*X_wer(i)+w(2)*Y_mod_oe(i-1);
    end
    
    %definicja  zmiennej
     Err_biter_wer=0;
     Err_iter_wer=0;
    
    for i = 1:1:koniec-1
        Err_biter_wer = Err_biter_wer+(Y_wer(i+1) - Y_mod_arx(i))^2;
    end
    
    for i = 1+r:1:koniec
        Err_iter_wer = Err_iter_wer+(Y_wer(i) - Y_mod_oe(i))^2;
    end
    
    %rysowanie wykresów
    figure
    hold on
    plot(k,Y_wer,'blue')
    plot(k(1+r:end),Y_mod_arx,'red')
    legend('y_{wer}(k)','y_{mod}(k)')
    title('Wersja bez iteracji')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    figure
    hold on
    plot(k,Y_wer,'blue')
    plot(k,Y_mod_oe,'red')
    legend('y_{wer}(k)','y_{mod}(k)')
    title('Wersja z iteracją')
    xlabel('k');
    ylabel('y(x)');
    hold off
    
    
    
    
end

if(r == 3)

    
end