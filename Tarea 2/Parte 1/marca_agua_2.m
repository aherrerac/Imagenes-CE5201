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

alpha=0.1;



[m,n] = size(I); %Dimensiones imagen con ruido y marca de agua

%Bloques 8 x 8 
sub = 8;

subVector = sub * ones(1,m/8);

%Se realiza la extraccion de la marca de agua
subIa = mat2cell(I,subVector,subVector);

[msa,nsa] = size(subIa);
Aa = zeros(msa,nsa);

for i = 1:msa
  for j = 1:nsa
   Aa(i,j) = dct(subIa{i,j})(1,1);
  endfor
endfor

[Ua,Sa,Va] = svd(Aa);

U1=load('U1.mat');
V1=load('V1.mat');

Da = U1 * Sa * V1';

Wa = (Da - S)/alpha;

subplot(2,3,6); 
imshow(Wa);
title('Watermark extracted'); 







