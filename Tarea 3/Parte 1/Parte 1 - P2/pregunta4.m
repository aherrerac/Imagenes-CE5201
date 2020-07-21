clc; clear; close all;
pkg load image;

%Imagen original a color y objeto a eliminar
M=imread('objEliminar.jpg');
subplot(2,2,2)
imshow(M)
title('Objeto a eliminar')

A=imread('imgOriginal.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen original')

R=inpainting(A,M);

subplot(2,2,3)
imshow(R)
title('Imegen sin el objeto')