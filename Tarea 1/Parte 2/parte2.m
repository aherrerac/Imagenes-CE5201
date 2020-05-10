clc; clear;

nImage = imread('limpiar.jpg');

xfiles = glob('.\original\*.jpg');
bfiles = glob('.\ruido\*.jpg');

fsize = length(xfiles);

C = zeros(4096,fsize);
B = zeros(4096,fsize);

for k = 1:fsize
  temp = imread(char(xfiles(k,1)));
  C(:,k) = temp(:);
  temp = imread(char(bfiles(k,1)));
  B(:,k) = temp(:);
endfor

C = im2double(C);

B = im2double(B);

s = mean(B,2);

[U,S,V] = svd(B); 

Ps = C * V(:,1:s) * V(:,1:s)'; 

r = 400

[Us,Ss,Vs] = svd(Ps);

Pr = Us(:,1:r) * Ss(1:r,1:r) * Vs(:,1:r)'; 
 



