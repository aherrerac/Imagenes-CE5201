pkg load image;
pkg load signal; 


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

subVector = sub * ones(1,m/8);

subI = mat2cell(I,subVector,subVector);

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

subplot(2,3,2);
imshow(A);
title('Transformada Discreta de Coseno 64x64'); 

[U,S,V] = svd(A); 

a = 0.1;

subplot(2,3,3);
imshow(W);
title('Watermark');


[U1,S1,V1] = svd(S + a * W);

Ap = U * S1 * V'; 

subplot(2,3,4);
imshow(Ap);
title('At');

IDCT = DCT;

%Cambio de F(1,1) en cada matriz de 8x8
for i = 1:ms
  for j = 1:ns
   DCT{i,j}(1,1) = Ap(i,j);
   IDCT{i,j} = idct(DCT{i,j});
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
   Aa(i,j) = dct(subIa{i,j})(1,1);
  endfor
endfor

[Ua,Sa,Va] = svd(Aa);

Da = U1 * Sa * V1';

Wa = (Da - S)/a;

subplot(2,3,6); 
imshow(Wa);
title('Watermark extracted'); 












  

