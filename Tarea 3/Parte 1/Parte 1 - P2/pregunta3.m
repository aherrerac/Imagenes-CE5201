clc; clear; close all;
pkg load image;

%Imagen paisaje original y marca
O=imread('paisaje.jpg');
M=imread('marca.jpg');
subplot(2,2,1)
imshow(O)
title('(a)paisaje.jpg')
subplot(2,2,2)
imshow(M)
title('(b)marca.jpg')


A=generar_imagen_restaurar(O,M);
subplot(2,2,3)
imshow(A)
title('(c)Imagen a restaurar')

R=inpainting(A,M);

subplot(2,2,4)
imshow(R)
title('(c)Imegen Restaurada')