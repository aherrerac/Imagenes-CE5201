clc; clear;
A=imread('barbara.jpg');
subplot(1,5,1)
imshow(A);
[m,n,c]=size(A);
Y=zeros(m,n,c);
Z1=Z2=Z3=zeros(m,n);

A1=A(:,:,1);
A2=A(:,:,2);
A3=A(:,:,3);
Z1=uint8(mediana1(A1));
disp('I´m done 1')
subplot(1,5,2)
imshow(Z1);
Z2=uint8(mediana1(A2));
disp('I´m done 2')
subplot(1,5,3)
imshow(Z2);
Z3=uint8(mediana1(A3));
disp('I´m done 3')
subplot(1,5,4)
imshow(Z3);

Y(:,:,1)=Z1;
Y(:,:,2)=Z2;
Y(:,:,3)=Z3;
[fila,columna,canales]=size(Y)
Y=uint8(Y);

subplot(1,5,5)
imshow(Y)