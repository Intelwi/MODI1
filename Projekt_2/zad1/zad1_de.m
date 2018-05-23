%Michał Stolarz
%Projekt nr 2 MODI

%pobranie danych
fileID = fopen('danestat41.txt','r');
formatSpec = '%g';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA)
fclose(fileID);
A=A'
X=A(1:end,1)
Y=A(1:end,2)

%zbiór uczący
X_ucz = X(1:2:end);
Y_ucz = Y(1:2:end);

%zbiór weryfikujący
X_wer = X(2:2:end);
Y_wer = Y(2:2:end); 

%-########################################################
i=4 % rząd modelu   ######################################
%#########################################################

%statyczny model nieliniowy rzędu 2
if(i==2)
    M = [ones(100,1),X_ucz,X_ucz.^2]
    w = M\Y_ucz % współczynniki funkcji liniowej
    
    syms u
    y = symfun(w(1) + w(2)*u + w(3)*(u^2),u);

    figure
    hold on
    fplot(y,[-1,1])
    title('Charakterystyka statyczna rzędu 2')
    xlabel('u');
    ylabel('y(u)');
    hold off
    
    %błąd dla zbioru uczącego
    E_ucz=0;

    E = (Y_ucz - M*w).^2; %wektor z błędami
    for i = 1:1:100
        E_ucz = E_ucz+E(i) ;
    end

    %błąd dla zbioru weryfikujacego
    E_wer=0;
    M1 = [ones(100,1),X_wer,X_wer.^2];

    E = (Y_wer - M1*w).^2; %wektor z błędami
    for i = 1:1:100
        E_wer = E_wer+E(i) ;
    end

    %wyjście modelu na tle zbioru danych uczących
    figure
    hold on
    scatter(X_ucz,Y_ucz,'red')
    scatter(X_ucz,M*w,'blue')
    title('Wyjście modelu rz 2 na tle danych uczących')
    xlabel('x');
    ylabel('y(x)');
    hold off

    %wyjście modelu na tle zbioru danych weryfikujących
    figure
    hold on
    scatter(X_wer,Y_wer,'red')
    scatter(X_wer,M1*w,'blue')
    title('Wyjście modelu rz 2 na tle danych weryfikujących')
    xlabel('x');
    ylabel('y(x)');
    hold off
end

%----------------------------------------------------------------

%statyczny model nieliniowy rzędu 3
if(i==3)
    M = [ones(100,1),X_ucz,X_ucz.^2,X_ucz.^3]
    w = M\Y_ucz % współczynniki funkcji liniowej
    
    syms u
    y = symfun(w(1) + w(2)*u + w(3)*(u^2) + w(4)*(u^3),u);

    figure
    hold on
    fplot(y,[-1,1])
    title('Charakterystyka statyczna rzędu 3')
    xlabel('u');
    ylabel('y(u)');
    hold off
    
    %błąd dla zbioru uczącego
    E_ucz=0;

    E = (Y_ucz - M*w).^2; %wektor z błędami
    for i = 1:1:100
        E_ucz = E_ucz+E(i) ;
    end

    %błąd dla zbioru weryfikujacego
    E_wer=0;
    M1 = [ones(100,1),X_wer,X_wer.^2,X_wer.^3];

    E = (Y_wer - M1*w).^2; %wektor z błędami
    for i = 1:1:100
        E_wer = E_wer+E(i) ;
    end

    %wyjście modelu na tle zbioru danych uczących
    figure
    hold on
    scatter(X_ucz,Y_ucz,'red')
    scatter(X_ucz,M*w,'blue')
    title('Wyjście modelu rz 3 na tle danych uczących')
    xlabel('x');
    ylabel('y(x)');
    hold off

    %wyjście modelu na tle zbioru danych weryfikujących
    figure
    hold on
    scatter(X_wer,Y_wer,'red')
    scatter(X_wer,M1*w,'blue')
    title('Wyjście modelu rz 3 na tle danych weryfikujących')
    xlabel('x');
    ylabel('y(x)');
    hold off
end

%----------------------------------------------------------------

%statyczny model nieliniowy rzędu 4
if(i==4)
    M = [ones(100,1),X_ucz,X_ucz.^2,X_ucz.^3,X_ucz.^4]
    w = M\Y_ucz % współczynniki funkcji liniowej
    
    syms u
    y = symfun(w(1) + w(2)*u + w(3)*(u^2) + w(4)*(u^3) + w(5)*(u^4),u);

    figure
    hold on
    fplot(y,[-1,1])
    title('Charakterystyka statyczna rzędu 4')
    xlabel('u');
    ylabel('y(u)');
    hold off
    
    %błąd dla zbioru uczącego
    E_ucz=0;

    E = (Y_ucz - M*w).^2; %wektor z błędami
    for i = 1:1:100
        E_ucz = E_ucz+E(i) ;
    end

    %błąd dla zbioru weryfikujacego
    E_wer=0;
    M1 = [ones(100,1),X_wer,X_wer.^2,X_wer.^3,X_wer.^4];

    E = (Y_wer - M1*w).^2; %wektor z błędami
    for i = 1:1:100
        E_wer = E_wer+E(i) ;
    end

    %wyjście modelu na tle zbioru danych uczących
    figure
    hold on
    scatter(X_ucz,Y_ucz,'red')
    scatter(X_ucz,M*w,'blue')
    title('Wyjście modelu rz 4 na tle danych uczących')
    xlabel('x');
    ylabel('y(x)');
    hold off

    %wyjście modelu na tle zbioru danych weryfikujących
    figure
    hold on
    scatter(X_wer,Y_wer,'red')
    scatter(X_wer,M1*w,'blue')
    title('Wyjście modelu rz 4 na tle danych weryfikujących')
    xlabel('x');
    ylabel('y(x)');
    hold off
end

%----------------------------------------------------------------

%statyczny model nieliniowy rzędu 5
if(i==5)
    M = [ones(100,1),X_ucz,X_ucz.^2,X_ucz.^3,X_ucz.^4,X_ucz.^5]
    w = M\Y_ucz % współczynniki funkcji liniowej
    
    syms u
    y = symfun(w(1) + w(2)*u + w(3)*(u^2) + w(4)*(u^3) + w(5)*(u^4) + w(6)*(u^5),u);

    figure
    hold on
    fplot(y,[-1,1])
    title('Charakterystyka statyczna rzędu 5')
    xlabel('u');
    ylabel('y(u)');
    hold off
    
    
    %błąd dla zbioru uczącego
    E_ucz=0;

    E = (Y_ucz - M*w).^2; %wektor z błędami
    for i = 1:1:100
        E_ucz = E_ucz+E(i) ;
    end

    %błąd dla zbioru weryfikujacego
    E_wer=0;
    M1 = [ones(100,1),X_wer,X_wer.^2,X_wer.^3,X_wer.^4,X_wer.^5];

    E = (Y_wer - M1*w).^2; %wektor z błędami
    for i = 1:1:100
        E_wer = E_wer+E(i) ;
    end

    %wyjście modelu na tle zbioru danych uczących
    figure
    hold on
    scatter(X_ucz,Y_ucz,'red')
    scatter(X_ucz,M*w,'blue')
    title('Wyjście modelu rz 5 na tle danych uczących')
    xlabel('x');
    ylabel('y(x)');
    hold off

    %wyjście modelu na tle zbioru danych weryfikujących
    figure
    hold on
    scatter(X_wer,Y_wer,'red')
    scatter(X_wer,M1*w,'blue')
    title('Wyjście modelu rz 5 na tle danych weryfikujących')
    xlabel('x');
    ylabel('y(x)');
    hold off
end

%####################################################
%rząd ## E_ucz   ## E_wer  ##########################
%####################################################
% 2   ## 34.8967 ## 35.2020
% 3   ## 2.1422  ## 2.3841
% 4   ## 0.4159  ## 0.3826
% 5   ## 0.4158  ## 0.3836
%####################################################


