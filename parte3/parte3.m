Timages=360;
I=40;
J=9;
M=112;
N=92;

%creando los valores base para el reconocimiento de rostros
[S,f,A,U,Xi]=faceRecognition(Timages,I,J,M,N);
##
##e0 = 50;
##e1 = 15;
##
##%intentando buscar match con caras de carpeta a comparar
##testImgs=zeros(M,N,I);
##for i=1:I
##  tt="";
##  %formamos el nombre del archivo
##  tt=strcat('Comparar\',int2str(i),'_10.png');
##  %insertando las imagenes a las imagenes de prueba
##  testImgs(:,:,I)=im2double(imread(tt));
##endfor
##
##%matriz para los Xs de las imagenes de prueba
##[fila,columna]=size(U(:,:,1:rank(A(:,:,1)))'*(testImgs(:,:,1)-f))
##X=zeros(fila,columna,I);
##%matriz para los f projection de las imagenes de prueba
##[fila,columna]=size(U(:,:,1:rank(A(:,:,1)))*X(:,:,1))
##fp=zeros(fila,columna);
##
##%%buscando para la imagen 1
##r=rank(A(:,:,pos));
##fProm=testImgs(:,:,1)-f;
##X(:,:,I)=U(:,:,1:r)'*(fProm);
##fp=U(:,:,1:r)'*X;
##
##%para saber si la imagen es una cara, o 
##%tiene caracteristica de tal
##ef=max(max(((fProm-fp)'*(fProm-fp))^(0.5)));
##t1=10000;
##if (ef>e1)
##    disp("not a face!!")
##else
##    ei=zeros(Timages);
##    for k=1:360
##      ei(k)=max(max(((X(:,:,1)-Xi(:,:,k))'*(X(:,:,1)-Xi(:,:,k)))^(0.5)));
##      if and(ei(k)<e0,ei(k)<t1)
##        disp("a posible match!!")
##        t1=ei(k);
##      endif
##    endfor
##endif
##
##tt