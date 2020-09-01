A=imread('imagen1.jpg');
Y=imread('imagenBi.jpg');
T=imread('imagenProm.jpg');
##A=im2double(A);
##Y=im2double(Y);
##T=im2double(T);

ImNorm=norma(A)
ImProm=norma(T)
ImBile=norma(Y)