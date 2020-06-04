clc;
clear;
pkg load image 
pkg load video 

V=VideoReader('video_con_ruido.mp4'); %Cargar video 

fr = V.NumberOfFrames; %Número de marcos 
m = V.Height; %Número de filas de cada marco 
n = V.Width; %Número de columnas de cada marco
Y = (zeros(m,n,3,fr)); %Matriz donde guardaremos los marcos del video 

for k=1:fr
  Z=readFrame(V);
  X1=uint8(mediana1(Z(:,:,1)));
  X2=uint8(mediana1(Z(:,:,2)));
  X3=uint8(mediana1(Z(:,:,3)));
  X(:,:,1)=uint8(X1);
  X(:,:,2)=uint8(X2);
  X(:,:,3)=uint8(X3);
  Y(:,:,:,k)= X;
endfor


video = VideoWriter('video_sin_ruido_1.mp4');
for i=1:fr
  writeVideo(video,Y(:,:,:,i));
endfor
close(video)

