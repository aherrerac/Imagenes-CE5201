clc; clear; close all;
pkg load image;

%Se carga y muestra la imagen original a color y objeto a eliminar
A=imread('imgOriginal.jpg');
subplot(2,2,1)
imshow(A)
title('Imagen original')

M=imread('objEliminar.jpg');
subplot(2,2,2)
imshow(M)
title('Objeto a eliminar')

%Se llama la función inpainting que elimina el objeto
R=inpainting(A,M);

%Se muestra el resultado
subplot(2,2,3)
imshow(R)
title('Imegen sin el objeto')imwrite(Y,'canal_1.jpg', 'quality',100)