%Michał Stolarz
%Projekt nr 2 MODI

%pobranie danych
fileID = fopen('danestat41.txt','r');
formatSpec = '%g';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA)
fclose(fileID);
A=A'

%wykres
X=A(1:end,1)
Y=A(1:end,2)
figure
hold on
scatter(X,Y,'red')
title('Dane')
xlabel('u');
ylabel('y(u)');
hold off

%zbiór uczący
X_ucz = X(1:2:end);
Y_ucz = Y(1:2:end);
figure
hold on
scatter(X_ucz,Y_ucz,'red')
title('Dane uczące')
xlabel('u');
ylabel('y(u)');
hold off

%zbiór weryfikujący
X_wer = X(2:2:end);
Y_wer = Y(2:2:end); 
figure
hold on
scatter(X_wer,Y_wer,'red')
title('Dane weryfikujące')
xlabel('u');
ylabel('y(u)');
hold off

%statyczny model liniowy
M = [X_ucz,ones(100,1)]
w = M\Y_ucz % współczynniki funkcji liniowej

%charakterystyka statyczna
syms u
y = symfun(u*w(1) + w(2),u);

figure
hold on
fplot(y,[-1,1])
title('Charakterystyka statyczna')
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
M1 = [X_wer,ones(100,1)];

E = (Y_wer - M1*w).^2; %wektor z błędami
for i = 1:1:100
    E_wer = E_wer+E(i) ;
end

%wyjście modelu na tle zbioru danych uczących
figure
hold on
scatter(X_ucz,Y_ucz,'red')
scatter(X_ucz,M*w,'blue')
title('Wyjście modelu na tle danych uczących')
xlabel('u');
ylabel('y(u)');
hold off

%wyjście modelu na tle zbioru danych weryfikujących
figure
hold on
scatter(X_wer,Y_wer,'red')
scatter(X_wer,M1*w,'blue')
title('Wyjście modelu na tle danych weryfikujących')
xlabel('u');
ylabel('y(u)');
hold off


