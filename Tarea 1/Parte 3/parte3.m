f1 = im2double(imread('Database\1_1.png'));
f2 = im2double(imread('Database\2_1.png'));
f3 = im2double(imread('Database\3_1.png'));
f4 = im2double(imread('Database\4_1.png'));
f5 = im2double(imread('Database\5_1.png'));
f6 = im2double(imread('Database\6_1.png'));
f7 = im2double(imread('Database\7_1.png'));
f8 = im2double(imread('Database\8_1.png'));
f9 = im2double(imread('Database\9_1.png'));


S = [f1 f2 f3 f4 f5 f6 f7 f8 f9 ];

f = (f1 + f2 + f3 + f4 + f5 + f7 + f8 + f9) / 9;

a1 = f1 - f;
a2 = f2 - f;
a3 = f3 - f;
a4 = f4 - f;
a5 = f5 - f;
a6 = f6 - f;
a7 = f7 - f;
a8 = f8 - f;
a9 = f9 - f;


A = [a1 a2 a3 a4 a5 a6 a7 a8 a9];

[U, E, V] = svd(A);

r = rank(A);

xi = U(:,1:r)' * A ;

x = U(:,1:r)' * (f1 - f);

epsilon_0 = 50;
epsilon_1 = 15;

imshow(f);

N = 9;
test_image = f1;


fp = U(:,1:r) * x;


ef = max(max(((f1 - f - fp)' * (f1 - f - fp))^0.5));

x1= U(:,1:r)' * (f1-f);
x2= U(:,1:r)' * (f2-f);
x3= U(:,1:r)' * (f3-f);

e1 = max(max(((x-x1)' * (x-x1))^0.5))
e2 = max(max(((x-x2)' * (x-x2))^0.5))
e3 = max(max(((x-x3)' * (x-x3))^0.5))
