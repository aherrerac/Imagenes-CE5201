clc; clear; close all;
pkg load image;

%%calculamos los valores para la marca
%%en la pregunta 3
####cargamos la marca
M1=im2double(imread('marca.jpg'));
subplot(1,2,1)
imshow(M1)
title('(a)marca.jpg')
####calculamos la cantidad de pixeles de la mascara
[m1,n1]=size(M1);
pixelQuantity1=m1*n1;
####calculamos la cantidad de pixeles blancos 
####en la mascara
disp('');disp('');
totalWhitePixels1=sum(sum(M1>=0.999));
totalWhiteArea1=totalWhitePixels1/pixelQuantity1

%%calculamos los valores para la marca
%%en la pregunta 4
####cargamos la marca
M2=im2double(imread('objEliminar.jpg'));
subplot(1,2,2)
imshow(M2)
title('(b)Objeto a eliminar')
####calculamos la cantidad de pixeles de la mascara
[m2,n2]=size(M2);
pixelQuantity2=m2*n2;
####calculamos la cantidad de pixeles blancos 
####en la mascara
disp('');disp('');
totalWhitePixels2=sum(sum(M2>=0.999));
totalWhiteArea2=totalWhitePixels2/pixelQuantity2
