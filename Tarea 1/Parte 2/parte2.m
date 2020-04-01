X = imread('original/sat_original8.jpg');
B = imread('ruido/sat_ruido8.jpg');

%True Image
C = im2double(X); 
%Noisy images  
B = im2double(B);

[Ub,Sb,Vb] = svd(B);

s = rank(B);

P = C * Vb(:,1:s) * Vb(:,1:s)';

[Up,Sp,Vp] = svd(P);

r = 2;

Ur = Up(:,1:r) ;
Sr = Sp(1:r,1:r);
Vr = Vp(:,1:r)'; 

Pr = Ur * Sr * Vr;

Z = Pr * B.';


   

imshow(Pr * B);