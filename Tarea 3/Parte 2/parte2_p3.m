pkg load image

%Implementacion GNO Octave del proceso de Croma
%Sustitucion del fondo verde de una imagen

A = imread('fondo_verde.jpg');

A = im2double(A);

%Creacion de mascara para croma

mask = and(A(:,:,1) <= 0.5 , A(:,:,2) >= 0.55 , A(:,:,3) <= 0.5);

%Realizacion del proceso de croma

%Nuevo fondo de la imagen
B = imread('playa.jpg');
B = im2double(B);


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

subplot(2,2,1);
imshow(new_A);
title('(a) Efecto Croma');

subplot(2,2,2);
imshow(!mask);
title('(b) Mascara para Efecto Croma');

%Gradiente Morfologica

mask_n = !mask; %Negativo de la máscara, cambio para visualizacion

m_mask = [0 1 0; 1 1 1; 0 1 0];

dilate = imdilate(mask_n,m_mask);

rode = imerode(mask_n,m_mask);

edge = dilate&~rode;

subplot(2,2,3)
imshow(edge);
title('(c) Gradiente Morfologica');


inpaintin_new_A = inpainting(im2uint8(new_A),im2uint8(edge));

subplot(2,2,4)
imshow(inpaintin_new_A);
title('(d) Imagen con convolucion en los bordes');

