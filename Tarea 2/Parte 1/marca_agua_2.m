pkg load image;
pkg load signal; 
clc; clear all;

O=imread('imagen3.jpg');
subplot(2,3,1);
imshow(O);
title('Imagen original');

I=imread('imagen2.jpg');
subplot(2,3,2);
imshow(I);
title('Imagen con ruido y marca de agua');

[m,n] = size(I); %Dimensiones imagen con ruido y marca de agua

%Bloques 8 x 8 
sub = 8;

subVector = sub * ones(1,m/8);

subI = mat2cell(I,subVector,subVector); 

DCT = subI;

[ms,ns] = size(subI);
A = zeros(ms,ns);


[mb,nb] = size(subI{1,1})
temp = zeros(mb,nb);

%Transformada discreta de coseno a cada bloque

for i = 1:ms
  for j = 1:ns
   dctTemp = dct(subI{i,j});
   A(i,j) = dctTemp(1,1);
   DCT{i,j} = dctTemp;
  endfor
endfor

subplot(2,3,3);
imshow(A);
title('Transformada Discreta de Coseno');

alpha=0.1;
U1=load('U1.mat');
V1=load('V1.mat');



