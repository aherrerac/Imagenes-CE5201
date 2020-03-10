
A=imread('imagen1.jpg');
Y=promedio(A);

subplot(1,2,1)
imshow(A)
title('Imagen original')

subplot(1,2,2)
imshow(Y)
title('Imagen rellenada')