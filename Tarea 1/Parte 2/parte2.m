%Imagen por limpiar 
nImage = im2double(imread('limpiar.jpg'));
%Realiza una lista con los archivos en formato jpg de la carpetas 
xfiles = glob('.\original\*.jpg');
bfiles = glob('.\ruido\*.jpg');
%Determina el largo de la lista anterior
fsize = length(xfiles);
%Crea una matriz de vectores transpuestos
C = zeros(4096,fsize);
B = zeros(4096,fsize);
%Se llena las matrices nuevas con imagenes como vectores
for k = 1:fsize
  temp = imread(char(xfiles(k,1)));
  %Pasa la imagen de matriz a vector transpuesto
  C(:,k) = temp(:);
  temp = imread(char(bfiles(k,1)));
  B(:,k) = temp(:);
endfor
%Cambio a formato double
C = im2double(C);
B = im2double(B);
%Rango de la matriz B
s = rank(B);
%Se realiza la Descomposicion de Valores Singulares
[U,S,V] = svd(B); 
%Teorema 3.1 P = C * V * V'
Ps = C * V(:,1:s) * V(:,1:s)'; 
%Se realiza el SVD de la nueva matriz P
[Us,Ss,Vs] = svd(Ps);

figure('Name','Image Deblurring SVD');
subplot(1,2,1);
imshow(nImage);
title('Noisy Image');

for r = 1:18:416
  %Calculo de P utilizando diferentes valores singulares
  Pr = Us(:,1:r) * Ss(1:r,1:r) * Vs(:,1:r)'; 
  %Matriz inversa de rango reducido
  Z = Pr * pinv(B);
  subplot(1,2,2);
  %Nueva imagen reconstruida
  x = Z * nImage(:);
  %Imagen Vector a Matriz de tamano igual al original
  imshow(reshape(x,[64 64]));
  title(sprintf('Deblur Image, with rank = %d', r));
  pause(1);
endfor






