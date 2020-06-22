pkg load image;
pkg load signal; 
clc; clear all;

O=imread('imagen3.jpg');
subplot(1,3,1);
imshow(O);
title('Imagen original');

I=imread('imagen2.jpg');
subplot(1,3,2);
imshow(I);
title('Imagen con ruido y marca de agua');

alpha=0.1;



[m,n] = size(I); %Dimensiones imagen con ruido y marca de agua

%Bloques 4 x 4 
sub = 4;

subVector = sub * ones(1,m/4);

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

load('U1.mat');
load('V1.mat');

Da = U1 * Sa * V1';

Wa = (Da - Sa)/alpha;

subplot(1,3,3); 
imshow(Wa);
title('Watermark extracted'); 







