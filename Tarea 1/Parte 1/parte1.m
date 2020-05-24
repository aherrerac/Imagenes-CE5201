%Carga imagen original
A = imread('imagen_original.jpg');
%Carga imagen con pixeles negros
B = imread('imagen1.jpg');

subplot(1,3,1);
imshow(A);
title('Imagen Original');

subplot(1,3,2);
P = promedio(B); %Calculo del promedio
imshow(P);
title('Imagen Promediada');

subplot(1,3,3);
Bi = bilineal(B); %Calculo Bilineal
imshow(Bi);
title('Imagen Bilineal');

A= im2double(A);

%Pasar a matrix 2x2, se promedian rgb
Aavrg = (A(:,:,1)+A(:,:,2)+A(:,:,3))/3;
Pavrg = (P(:,:,1)+P(:,:,2)+P(:,:,3))/3;
Biavrg =(Bi(:,:,1)+Bi(:,:,2)+Bi(:,:,3))/3;

%Calcula la norma de frobenius
Afro = norm(Aavrg,"fro")
Pfro = norm(Pavrg,"fro")
Bifro = norm(Biavrg,"fro")

