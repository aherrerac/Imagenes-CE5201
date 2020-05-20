
A = imread('imagen_original.jpg');

B = imread('imagen1.jpg');

subplot(1,3,1);
imshow(A);
title('Imagen Original');

subplot(1,3,2);
imshow(promedio(B));
title('Imagen Promediada');

subplot(1,3,3);
imshow(bilineal(B));
title('Imagen Bilineal');

