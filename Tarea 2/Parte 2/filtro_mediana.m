function B=filtro_mediana(A)
  %filtro de mediana
  [m,n]=size(A);
  B=uint8(zeros(m,n));
   %%filtrando esquinas
  %esquina 1,1
  B(1,1)=median([A(1,1),A(2,1),A(1,2),A(2,2)]);
  %esquina m,1
  B(m,1)=median([A(m-1,1),A(m,1),A(m-1,2),A(m,2)]);
  %esquina 1,n
  B(1,n)=median([A(1,n-1),A(2,n-1),A(1,n),A(2,n)]);
  %esquina m,n
  B(m,n)=median([A(m-1,n-1),A(m,n-1),A(m,n),A(m-1,n)]);
  
  %%filtrando bordes
  %bordes donde i=2:m-1
  for i=2:m-1
    B(i,1)=median([A(i-1,1),A(i,1),A(i+1,1),A(i-1,2),A(i,2),A(i+1,2)]);
    B(i,n)=median([A(i-1,n),A(i,n),A(i+1,n),A(i-1,n-1),A(i,n-1),A(i+1,n-1)]);
  endfor
  %bordes donde j=2:n-1
  for j=2:n-1
    B(1,j)=median([A(1,j-1),A(1,j),A(1,j+1),A(2,j-1),A(2,j),A(2,j+1)]);
    B(m,j)=median([A(m,j-1),A(m,j),A(m,j+1),A(m-1,j-1),A(m-1,j),A(m-1,j+1)]);  
  endfor
  
  %%filtrando el resto de la imagen.
  for x=2:m-1
    for y=2:n-1
      Bloque=A(x-1:x+1,y-1:y+1);
      vecBloq=Bloque(:);
      B(x,y)=median(vecBloq);
    endfor
  endfor  
endfunction