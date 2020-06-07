clc; clear
pkg load image
pkg load video

%%testing the method IAMFA1 and filtro_mediana
%mostrando la imagen sin ruido
V=VideoReader('video_con_ruido.mp4');
fr=V.NumberOfFrames; %cantidad de frames
m=V.Height; %cant de rows(filas) de las imagenes
n=V.Width; %cant de columns(col) de las imagenes
Y=uint8(zeros(m,n,3,fr)); %filas, columnas, canales, y cantidad de estos
M=uint8(zeros(m,n,3,fr)); %matriz resultante con las imagenes filtradas

%leer el video y guardar las imagenes en la nueva matriz
for k=1:fr
  Y(:,:,:,k)=readFrame(V); %leer cada imagen del video, donde Z es a color
  %filtrando la imagen al aplicarle el filtro IAMFA1
  A=Y(:,:,:,k);
  M(:,:,1,k)=IAMFA1(A(:,:,1));
  M(:,:,2,k)=IAMFA1(A(:,:,2));
  M(:,:,3,k)=IAMFA1(A(:,:,3));
endfor

video=VideoWriter('video_sin_ruido_2.mp4'); %buffer para video nuevo
for i=1:fr
  writeVideo(video, M(:,:,:,i)); %agregando imagenes a buffer
endfor
close(video);