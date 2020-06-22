pkg load image;
pkg load signal; 
clc; clear all;

O=imread('imagen3.jpg');
subplot(1,3,1);
imshow(O);
title('Imagen original');

%Tamano de la matriz original 
[m,n] = size(O);

sub = 4;

subVector = sub * ones(1,m/4);

subI = mat2cell(O,subVector,subVector);

DCT = subI;

[ms,ns] = size(subI);
A = zeros(ms,ns);


[mb,nb] = size(subI{1,1});
temp = zeros(mb,nb);

for i = 1:ms
  for j = 1:ns
   dctTemp = dct(subI{i,j});
   A(i,j) = dctTemp(1,1);
   DCT{i,j} = dctTemp;
  endfor
endfor

[U,S,V] = svd(A);

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

Wa = (Da - S)/alpha;

subplot(1,3,3); 
imshow(Wa);
title('Marca de agua'); 







