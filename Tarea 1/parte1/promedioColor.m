function Prom=promedioColor(TT)
##  TT=im2double(TT);
  [m,n,z]=size(TT);
  Prom=zeros(1,1,3);
  for i=1:n
    Prom(1,1,:)=Prom(1,1,:)+TT(1,i,:);
  endfor
  Prom(1,1,:)=Prom(1,1,:)/n;
end