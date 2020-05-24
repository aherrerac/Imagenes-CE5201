function [S,f,r,U,Xi]=train()
  pkg load image
  %se buscan los nombres de las imagenes
  %en la carpeta.
  files = glob('.\Database\*.png');
  %imagen de prueba para dimensiones
  testImg=imread(char(files(1,1))); 
  [M,N]=size(testImg);
  Timages=size(files,1);
  S=im2double(zeros(M*N,Timages));
  f=im2double(zeros(M*N,1));
  %loop para cargar las imagenes 
  %de la base de datos
  for i=1:Timages
    %insertando las imagenes a S
    H=im2double(imread(char(files(i,1))));
    S(:,i)=H(:);
    f+=H(:);
  endfor
  %vector f techo.
  f=f/Timages;
  %matriz A.
  A= S - f;
  % se ocupa U
  [U,E,Vt]=svd(A);
  r=size(A,2);
  %calculando los Xi
  Xi=U(:,1:r)'*A;
endfunction