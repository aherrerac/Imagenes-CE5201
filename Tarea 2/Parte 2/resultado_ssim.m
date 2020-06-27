clc; clear;
pkg load image
pkg load video

%%testing the method IAMFA1 and filtro_mediana
%mostrando la imagen sin ruido
V=VideoReader('video_limpio.mp4'); fr=V.NumberOfFrames; m=V.Height; n=V.Width; 
Original=uint8(zeros(m,n,3,fr)); %filas, columnas, canales, y cantidad de estos

X=VideoReader('video_sin_ruido_1.mp4');
Mediana1=uint8(zeros(m,n,3,fr)); %matriz de salida con la imagenes filtradas.
ResMed1=0; %varaible para guardar los resultados de SSIM

Y=VideoReader('video_sin_ruido_2.mp4');
Mediana3=uint8(zeros(m,n,3,fr)); %matriz de salida con la imagenes filtradas.
ResMed3=0; %variable para guardar los resultados de SSIM

%leer el video y guardar las imagenes en la nueva matriz
for k=1:fr
  Original(:,:,:,k)=readFrame(V);
  Mediana1(:,:,:,k)=readFrame(X);
  Mediana3(:,:,:,k)=readFrame(Y);
endfor

%calculando resultados de SSIM para filtro mediana y SSIM para IAMFA1
for k=1:fr
  [c11, xz]=ssim(Original(:,:,1,k),Mediana1(:,:,1,k));
  [c12, xz]=ssim(Original(:,:,2,k),Mediana1(:,:,2,k));
  [c13, xz]=ssim(Original(:,:,3,k),Mediana1(:,:,3,k));
  t1=(c11+c12+c13)/3;
  ResMed1+=t1;
  
  [c31, xz]=ssim(Original(:,:,1,k),Mediana3(:,:,1,k));
  [c32, xz]=ssim(Original(:,:,2,k),Mediana3(:,:,2,k));
  [c33, xz]=ssim(Original(:,:,3,k),Mediana3(:,:,3,k));
  t3=(c31+c32+c33)/3;
  ResMed3+=t3;
endfor

ResMed1=(ResMed1/fr)
ResMed3=(ResMed3/fr)

disp("El filtro, promediando SSIM en todos los frames, más optimo es: ")
if(ResMed1>ResMed3)
  ResMed1
else
  ResMed3
endif