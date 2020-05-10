clc; clear;

nImage = im2double(imread('limpiar.jpg'));

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

s = rank(B);

[U,S,V] = svd(B); 

Ps = C * V(:,1:s) * V(:,1:s)'; 

[Us,Ss,Vs] = svd(Ps);

figure('Name','Image Deblurring SVD');

subplot(1,2,1);

imshow(nImage);

title('Noisy Image');

for r = 1:18:416
  Pr = Us(:,1:r) * Ss(1:r,1:r) * Vs(:,1:r)'; 
  Z = Pr * pinv(B);
  subplot(1,2,2);
  x = Z * nImage(:);
  imshow(reshape(x,[64 64]));
  title(sprintf('Deblur Image, with rank = %d', r));
  pause(1);
endfor






