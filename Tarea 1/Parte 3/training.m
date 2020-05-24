function [S, U, r, xi, f] =training()
  %Lista de archivos en el directorio
  files = glob('.\Database\*.png');
  %Lectura de la imagen para obtener variables
  sampleImage = imread(char(files(1,1)));
  %Tamano del vector imagen que se va a crear
  imgSize = size(sampleImage,1) * size(sampleImage,2);
  %Cantidad de archivos en el directorio 
  fileLength = length(files);
  %Crea matriz para guardar imagenes
  S = zeros(imgSize,fileLength/9);
  %Logica para guardar el promedio de las caras similares en una sola matriz
  faceCtr = 1;
  indvCtr = 1;
  tempImg = zeros(size(sampleImage));
  for k = 1:fileLength
    if faceCtr < 9
      %Se realiza la suma de las caras similares
      tempImg += im2double(imread(char(files(k,1))));
      ++faceCtr;
    else
      %Promedio de las imagenes sumadas y se guarda en la nueva matriz
      tempImg += im2double(imread(char(files(k,1))));
      S(:,indvCtr) = tempImg(:)/9;
      tempImg = zeros(size(sampleImage));
      faceCtr = 1;
      ++indvCtr;
    end
  endfor
  %Se calcula el promedio de las imagenes como vectores  
  f = mean(S,2);
  %Matriz de imagenes menos el promedio de ellas
  A =  S - f;
  %Calculo del rango
  r = size(A,2); %40
  %Descomposicion de valores singulares
  [U,Ss,V] = svd(A);
  %Vector de coordenadas 
  xi = U(:,1:r)' * A ;

endfunction





