%funcion para hacer el Mid Value Decision Median
%recibe un vector con tres pixeles A[P1,P2,P3]
function P=MVDM(A)
  AA=sort(A);
  if(AA(2)==255)
    P=AA(1);
  elseif(AA(2)==0)
    P=AA(3);
  else
    P=AA(2);
  endif
endfunction
