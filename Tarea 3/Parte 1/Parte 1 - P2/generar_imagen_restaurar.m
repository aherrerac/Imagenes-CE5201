function I3=generar_imagen_restaurar(O, M)

%Imagen Original: O
[m,n]=size(O);
I1=zeros(m,n);
I1=O;

%Texto: M
[m,n]=size(M);
I2=zeros(m,n);
I2=M;

%Convertir imagen a Binaria. Parte Blanca = Texto. Parte Negra = Valor de 0
I2(I2<50)=0; I2(I2>=50)=255; 

%Imagen a Restaurar: I3
I3=I1+I2;

endfunction