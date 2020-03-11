function Y=promedio(A)
  [xmax,ymax,ch]=size(A);
  A=im2double(A);
  Y=zeros(xmax,ymax,ch);
  for i=1:xmax
    for j=1:ymax
      r=A(i,j,1);
      g=A(i,j,2);
      b=A(i,j,3);
      if or(g<=0.09, b<=0.09, r<=0.09)
        %esquinas
        if and(i==1,j==1)
          %obtener 3 pixeles
          tt=[A(i,j+1,:) A(i+1,j,:) A(i+1,j+1,:)];
        elseif and(i==xmax,j==ymax)
          %obtener 3 pixeles
          tt=[A(i,j-1,:) A(i-1,j,:) A(i-1,j-1,:)];
        elseif and(i==1,j==ymax)
          %obtener 3 pixeles
          tt=[A(i,j-1,:) A(i+1,j,:) A(i+1,j-1,:)];
        elseif and(i==xmax,j==1)
          %obtener 3 pixeles
          tt=[A(i,j+1,:) A(i-1,j,:) A(i-1,j+1,:)];
        %froteras de la imagen
        elseif (i==1)
          %obtener 5 pixeles
          tt=[A(i,j-1,:) A(i+1,j-1,:) A(i+1,j,:) A(i+1,j+1,:) A(i,j+1,:)];
        elseif (i==xmax)
          %obtener 5 pixeles
          tt=[A(i,j-1,:) A(i-1,j-1,:) A(i-1,j,:) A(i-1,j+1,:) A(i,j+1,:)];
        elseif (j==1)
          %obtener 5 pixeles
          tt=[A(i-1,j,:) A(i-1,j+1,:) A(i,j+1,:) A(i+1,j+1,:) A(i+1,j,:)];
        elseif (j==ymax)
          %obtener 5 pixeles
          tt=[A(i-1,j,:) A(i-1,j-1,:) A(i,j-1,:) A(i+1,j-1,:) A(i+1,j,:)];
        else
          %obtener 8 pixeles
          tt=[A(i-1,j-1,:) A(i,j-1,:) A(i+1,j-1,:) A(i+1,j,:) A(i+1,j+1,:) A(i,j+1,:) A(i-1,j+1,:) A(i-1,j,:)];
        endif
        Y(i,j,:)= promedioColor(tt);
      else 
        Y(i,j,:)=A(i,j,:);
      endif
    endfor
  endfor  
end