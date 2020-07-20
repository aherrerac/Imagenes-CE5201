clc; clear;
%Script que permite obtener una matriz B(4x4x3) 
%a partir de A(4x4x3)

%Matriz A predefinida
A = zeros(4,4,3);
[m,n,c] = size(A);

%Valores de cada canal
A(:,:,1) = [5 10 15 20; 4 8 12 16; 3 6 9 12; 2 4 6 8];

A(:,:,2) = [1 2 3 4; 1 3 5 7; 2 4 6 8; 1 4 7 10];

A(:,:,3) = [0 0 0 0; 5 5 5 5; 10 10 10 10; 15 15 15 15];

%Mascaras / codicionales sin iteraciones

mask = A <= 10;

%Inicializacion de la nueva matriz

B = zeros(m,n,c); %Se crea nueva matriz con zeros para cumplir condicion

%Se crea nueva matriz con las mascaras condicionales

B(mask) = -30;
B(!mask) = 30



