clc; clear;
%Implementacion GNO Octave del proceso de Croma
%Sustitucion del fondo verde de una imagen

A = imread('fondo_verde.jpg');

A = im2double(A);

figure(1);
subplot(2,2,1);
imshow(A);
title('a.Imagen con Fondo Verde');

subplot(2,2,2);
imshow(A(:,:,1));
title('b.Canal Rojo');

subplot(2,2,3);
imshow(A(:,:,2));
title('c.Canal Verde');

subplot(2,2,4);
imshow(A(:,:,3));
title('d.Canal Azul');

figure(2);

subplot(2,2,1);
imshow(A);
title('a.Imagen Fondo Verde');

%Creacion de mascara para croma

mask = and(A(:,:,1) <= 0.5 , A(:,:,2) >= 0.55 , A(:,:,3) <= 0.5);

%Eliminacion del fondo verde(Visualizacion)
A_black = A;
%R
Ar_black = A(:,:,1);
Ar_black(mask) = 0;
%G
Ag_black = A(:,:,2);
Ag_black(mask) = 0;
%B
Ab_black = A(:,:,3);
Ab_black(mask) = 0;
%Cambio de todos los canales
A_black(:,:,1) = Ar_black;
A_black(:,:,2) = Ag_black;
A_black(:,:,3) = Ab_black;


subplot(2,2,2);
imshow(A_black);
title('b. Imagen con Fondo Negro');

%Realizacion del proceso de croma

%Nuevo fondo de la imagen
B = imread('playa.jpg');
B = im2double(B);

subplot(2,2,3);
imshow(B);
title('c.Fondo Nuevo de Playa');

%Eliminacion del fondo verde(Visualizacion)

new_A = A;

%r
new_Ar = A(:,:,1);
new_Ar(mask) = B(:,:,1)(mask);
%g
new_Ag = A(:,:,2);
new_Ag(mask) = B(:,:,2)(mask);
%b
new_Ab = A(:,:,3);
new_Ab(mask) = B(:,:,3)(mask);

%Cambio de todos los canales
new_A(:,:,1) = new_Ar;
new_A(:,:,2) = new_Ag;
new_A(:,:,3) = new_Ab;

subplot(2,2,4);
imshow(new_A);
title('d. Efecto Croma');






 