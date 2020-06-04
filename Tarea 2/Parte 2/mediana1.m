function B=mediana1(A);

  %Filtro de la mediana
  [m,n]=size(A);
  B=zeros(m,n);
  
  %Calcular el filtro en los bordes de la imagen (TAREA)
  for x=1:m
    for y=1:n
    %Ezquinas
      if and(x==1, y==1)
        Bloque=A(x:x+1, y:y+1);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif and(x==1, y==n)
        Bloque=A(x:x+1, y-1:y);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif and(x==m, y==1)
        Bloque=A(x-1:x, y:y+1);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif and(x==m, y==n)
        Bloque=A(x-1:x, y-1:y);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      %Bordes
      elseif x==1
        Bloque=A(x:x+1, y-1:y+1);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif x==m
        Bloque=A(x-1:x, y-1:y+1);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif y==1
        Bloque=A(x-1:x+1, y:y+1);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);
      elseif y==n
        Bloque=A(x-1:x+1, y-1:y);
        vecAux=Bloque(:);
        B(x,y)=median(vecAux);  
      %Centro
      else
        Bloque=A(x-1:x+1,y-1:y+1); %Bloque para calcular la mediana 
        vecAux=Bloque(:); %Convierte una matriz en vector, concatenando las columnas 
        B(x,y)=median(vecAux);
      endif
    endfor
  endfor
  
  
endfunction
