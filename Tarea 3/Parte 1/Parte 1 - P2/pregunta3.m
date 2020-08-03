clc; clear; close all;
pkg load image;

%Se carga y muestra la imagen paisaje original y marca
O=imread('paisaje.jpg');
M=imread('marca.jpg');
subplot(2,2,1)
imshow(O)
title('(a)paisaje.jpg')
subplot(2,2,2)
imshow(M)
title('(b)marca.jpg')

%Se llama la función para generar la imagen que se debe restaurar
%Se muestra la imagen 
A=generar_imagen_restaurar(O,M);
subplot(2,2,3)
imshow(A)
title('(c)Imagen a restaurar')

%Se llama la función inpainting la cual restaura la imagen
R=inpainting(A,M);

%Se muestra el resultado 
subplot(2,2,4)
imshow(R)
title('(c)Imegen Restaurada')