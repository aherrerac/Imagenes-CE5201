%clear;clc; close all
%%%%
%pkg load image

function I3=generar_imagen_restaurar(O, M)

%Imagen Original: I1
%I1=imread('paisaje.jpg');
[m,n]=size(O);
I1=zeros(m,n);
I1=O;
%subplot(2,2,1)
%imshow(I1)
%title('(a) paisaje.jpg','FontSize',16)

%Texto: I2
%I2=imread('marca.jpg');
[m,n]=size(M);
I2=zeros(m,n);
I2=M;
I2(I2<50)=0; I2(I2>=50)=255; %Convertir imagen a Binaria. Parte Blanca = Texto. Parte Negra = Valor de 0
%subplot(2,2,2)
%imshow(I2)
%title('(b) marca.jpg','FontSize',16)

%Imagen a Restaurar: I3
I3=I1+I2;
%subplot(2,2,3)
%imshow(I3)
%title('(c) Imagen a Restaurar','FontSize',16)

endfunction