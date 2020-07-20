clc; clear;
%Script que permite obtener una matriz B(4x4) 
%a partir de A(4x4x3)

%Matriz A predefinida
A = zeros(4,4,3);
[m,n] = size(A);

%Valores de cada canal
A(:,:,1) = [5 10 15 20; 4 8 12 16; 3 6 9 12; 2 4 6 8];

A(:,:,2) = [1 2 3 4; 1 3 5 7; 2 4 6 8; 1 4 7 10];

A(:,:,3) = [0 0 0 0; 5 5 5 5; 10 10 10 10; 15 15 15 15];

%Mascaras / codicionales sin iteraciones

mask_1 = A(:,:,1) > 5;

mask_2 = A(:,:,3) >= 10;

mask_3 = A(:,:,2) < 5;

%Inicializacion de la nueva matriz

B = zeros(m,n); %Se crea nueva matriz con zeros para cumplir condicion

%Se crea nueva matriz con las mascaras condicionales

B(and(mask_1,mask_2,mask_3)) = 1 

