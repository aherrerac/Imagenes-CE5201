clc; clear;
pkg load image

%creando los valores base para el 
%reconocimiento de rostros
[S,f,r,U,Xi]=training();

%definiendo e_0 y e_1
e0 = 30;
e1 = 10;

%obtiene todos los nombres de la 
%carpeta de comparar.
files = glob('.\Comparar\*.png');
test=imread(char(files(1,1)));
[M,N]=size(test);
Timages=size(files,1);

##mostrando la cara promedio de la base
## de datos de caras.
figure('Name','Imagen Promedio');
imshow(reshape(f,[M,N]));

%peparando para mostrar la cara mas parecida
%de la base de datos, contra las de comparar.
for i=1:Timages
  testImg=im2single(imread(char(files(i,1))));
  fProm=testImg(:)-f;
  X=U(:,1:r)'*(fProm);
  fp=U(:,1:r)*X;
  ef=((fProm-fp)'*(fProm-fp))^0.5;

  if (ef>e1)
    %mostrando rostro que no es humano
    char(files(i,1))
    disp("Not a human face");
    figure('Name','Reconocimento Facial');
    subplot(1,1,1);
    imshow(testImg);
    title('Not a human face');
    continue;
  endif
  
  l=size(Xi,2);
  e_i=zeros(l,1);
  for k=1:l
    e_i(k,1)=((X-Xi(:,k))'*(X-Xi(:,k)))^0.5;
  endfor
  
  [ei_min pos]=min(e_i);
  
  if (ei_min>e0)
    %mostrando rostro humano no conocido
    char(files(i,1))
    disp("Not a know human face");
    figure('Name','Reconocimento Facial');
    subplot(1,1,1);
    imshow(testImg);
    title('Not a human face');
    continue;
  endif
  %mostrando la cara mas parecida.
  figure('Name','Reconocimento Facial');
  subplot(1,2,1);
  imshow(testImg);
  title('Testing Face');
  
  subplot(1,2,2);
  imshow(reshape(S(:,pos),[M,N]));
  title('Most similar from DB');
endfor