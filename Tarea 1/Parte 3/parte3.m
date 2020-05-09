
[U,r,xi] = training();

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
