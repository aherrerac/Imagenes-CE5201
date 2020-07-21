function R=inpainting(A,M)

[m, n, r]=size(A);


%Validamos si la imagen es a color o escala de grises
if r == 1
  % Se crea la mascara la cual es una matriz de bloques 1 x 1, con una 
  % copia de M=marca, en cada elemento
  mascara = repmat(M, 1);
  R=A;
else
  mascara = repmat(M, [1 1 r]);
  R = A .* (1 - M);
endif 

% Se crea un vector de indices de elementos distintos a cero encontrados 
% en la mascara
mascaraI = find(mascara);

% Se crean la matriz kernel de difusión con los valores de a, b y c 
% estos valores se toman del paper
a=0.073235;
b=0.176765;
c=0.125;
k=[a b a; b 0 b; a b a];

% mascaraDif iteraciones infinitas
mascaraDif = Inf;
% Se define una tolerancia
tol=0.1;
% La condicion de finalizacion se cumple cuando el promedio de la diferencia 
% entre dos convoluciones sucesivas sea menor a la tolerancia 
while mascaraDif > tol
    % Se realiza la convolución de R con el kernel 1 y se guarda en una variable 
    % temporal 
    tempImg = imfilter(R, k, "conv");
    % Se calcula el promedio de la diferencia entre el resultado anterior y el 
    % actual, se utiliza int16 para manejar valores positivos y negativos
    mascaraDif = mean(abs(int16(R(mascaraI)) - int16(tempImg(mascaraI))));
    R(mascaraI) = tempImg(mascaraI);
endwhile
    