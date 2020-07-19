pkg load image; %Paquete para manejo de imagenes
pkg load signal;%Paquete para manejo de matrices

%Extraer matriz de la imagen original 
I = imread('imagen1.jpg');
I = im2double(I);

W = imread('marca.jpg');
W = im2double(W);

subplot(2,3,1); 
imshow(I); 
title('Imagen Original');

%Tamano de la matriz original 
[m,n] = size(I);

sub = 8;

%Se crea vector columna para crear un subconjunto
subVector = sub * ones(1,m/8);

%Crea elementos de 8x8 en una matriz de 64x64
subI = mat2cell(I,subVector,subVector);

%Inicializa matriz para guardar la transformada
DCT = subI;
[ms,ns] = size(subI);

%Matriz que guarda los elementos F(1,1) de la DCT
A = zeros(ms,ns);

%Tamano de filas y columnas para realizar la iteracion
[mb,nb] = size(subI{1,1});
temp = zeros(mb,nb);

for i = 1:ms
  for j = 1:ns
   %Transformada Discreta de Coseno para matriz 8x8
   dctTemp = dct2(subI{i,j});
   %Se almacena el valor F(1,1)
   A(i,j) = dctTemp(1,1);
   %Se actualizan los valores de las transformada
   DCT{i,j} = dctTemp;
  endfor
endfor

subplot(2,3,2);
imshow(A);
title('Transformada Discreta de Coseno 64x64'); 

%Se realiza la descomposicion de valores singulares
[U,S,V] = svd(A); 

%alpha
a = 0.1;

subplot(2,3,3);
imshow(W);
title('Watermark');

% SVD que contiene la informacion de la DCT y la marca de agua
[U1,S1,V1] = svd(S + a * W);

%Se crea una nueva matriz de tamano 64x64 valores de la DCT y la marca de agua
Ap = U * S1 * V'; 

subplot(2,3,4);
imshow(Ap);
title('At');

%Matriz para guardar la transformada inversa
IDCT = DCT;

%Cambio de F(1,1) en cada matriz de 8x8
for i = 1:ms
  for j = 1:ns
   %Se extraen los nuevos valores F(1,1)  
   DCT{i,j}(1,1) = Ap(i,j);
   %Transformada inversa con datos de la marca de agua
   IDCT{i,j} = idct2(DCT{i,j});
  endfor
endfor

%Matriz con la imagen (Watermarked)
Ia = cell2mat(IDCT);

subplot(2,3,5);
imshow(Ia);
title('Watermarked Image');

%Se realiza la extraccion de la marca de agua
subIa = mat2cell(Ia,subVector,subVector);

[msa,nsa] = size(subIa);
Aa = zeros(ms,ns);

for i = 1:msa
  for j = 1:nsa
   %Calculo de la transformada DCT
   Aa(i,j) = dct2(subIa{i,j})(1,1);
  endfor
endfor

%Proceso para obtener la marca de agua
[Ua,Sa,Va] = svd(Aa);

% Matriz con informacion de la marca de agua 64x64
Da = U1 * Sa * V1';

%alpha igual al punto anterior
Wa = (Da - S)/a;

subplot(2,3,6); 
imshow(Wa);
title('Watermark extracted'); 

%Norma de Frobenius 
n_original = norm(I,"fro");
n_marca = norm(Ia,"fro");

%Porcentaje de diferencia
dif = ((n_marca - n_original)/n_original)*100







  

