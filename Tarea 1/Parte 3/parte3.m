


[U,r,xi,f] = training();

f1 = im2double(imread('Comparar/1_10.png'));
f1 = f1(:);

x = U(:,1:r)' * (f1 - f);

