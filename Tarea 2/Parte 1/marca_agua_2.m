pkg load image;
pkg load signal; 
clc; clear all;

%Cargamos la imagen original
O=im2double(imread('imagen3.jpg'));

%Tamano de la matriz original 
[m,n] = size(O);

%Este paso es necesario para obtener S
%División en bloques 4x4
sub = 4;

subVector = sub * ones(1,m/4);

subI = mat2cell(O,subVector,subVector);

DCT = subI;

[ms,ns] = size(subI);
A = zeros(ms,ns);

[mb,nb] = size(subI{1,1});
temp = zeros(mb,nb);

%Creamos la matriz A a partir de los bloques 4x4 aplicando 
%Transformada discreta de coseno (DCT)

for i = 1:ms
  for j = 1:ns
   dctTemp = dct(subI{i,j});
   A(i,j) = dctTemp(1,1);
   DCT{i,j} = dctTemp;
  endfor
endfor

%Obtenemos la descomposicion en valores singulares
[U,S,V] = svd(A); 

%Cargamos Imagen con ruido y marca de agua
I=im2double(imread('imagen2.jpg'));
subplot(1,2,1);
imshow(I);
title('Imagen con ruido y marca de agua');

%Se define el alpha indicado en las especificaciones 
%de la tarea
alpha=0.1;

%Dimensiones imagen con ruido y marca de agua
[m,n] = size(I); 

%Paso 1 de extracción
%Creación de bloques 4 x 4 
sub = 4;

subVector = sub * ones(1,m/4);

%Se realiza la extraccion de la marca de agua
subIa = mat2cell(I,subVector,subVector);

[msa,nsa] = size(subIa);
Aa = zeros(msa,nsa);

%Se crea Aa con la DCT de cada bloque
for i = 1:msa
  for j = 1:nsa
   Aa(i,j) = dct(subIa{i,j})(1,1);
  endfor
endfor

%Paso 2 de extracción 
%Obtenemos la descomposicion en valores singulares de Aa 
[Ua,Sa,Va] = svd(Aa);

%Cargamos la descomposición de valores singulares U, V de la
%marca de agua que fue incertada en la imagen I 
load('U1.mat');
load('V1.mat');

%Paso 3 de la extracción
Da = U1 * Sa * V1';

Wa = (Da - S)/alpha;

subplot(1,2,2); 
imshow(Wa);
title('Marca de agua'); 






