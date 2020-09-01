function F=norma(A)
  A=im2double(A);
  [m,n,z]=size(A);
  F=zeros(1,1,3);
  for i=1:m
    for j=1:n
      F=F+(abs(A(i,j,:)).^2);
    endfor
  endfor
  F=sqrt(F);
endfunction
