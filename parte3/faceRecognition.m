function [S,f,A,U,Xi]=faceRecognition(Timages,I,J,M,N)
  S=zeros(M,N,Timages);      %-----------muy necesario--------------
  f=zeros(M,N);              %-----------muy necesario--------------
  %loop para cargar las imagenes 
  %de la base de datos
  for i=1:I
    for j=1:J
      tt="";
      %formamos el nombre del archivo
      tt=strcat('Database\',int2str(i),'_',int2str(j),'.png');
      %insertando las imagenes a S
      H=im2double(imread(tt));
      pos=(i-1)*I+j;
      S(:,:,pos)=H;
      f=f+H;
    endfor
  endfor

  f=f/Timages;              %-----------muy necesario--------------

  A=zeros(M,N,Timages);   %-----------muy necesario--------------
  U=zeros(M,M,Timages);   %-----------muy necesario--------------
  Vt=zeros(N,N,Timages);    
  E=zeros(M,N,Timages);    

  %Llenando la matriz A y los Ui Ei Vti con el svd(Ai)
  for i=1:I
    for j=1:J
      pos=(i-1)*I+j;
      A(:,:,pos)=S(:,:,pos)-f;
      [U(:,:,pos),E(:,:,pos),Vt(:,:,pos)]=svd(A(:,:,pos));
    endfor
  endfor

  %calculando los Xi
  [fila,columna]=size(U(:,:,1:rank(A(:,:,1)))'*A(:,:,1));
  Xi=zeros(fila,columna,360);

  for i=1:I
    for j=1:J
      pos=(i-1)*I+j;
      r=rank(A(:,:,pos));
      Xi(:,:,pos)=U(:,:,1:r)'*A(:,:,pos);
    endfor
  endfor
endfunction
