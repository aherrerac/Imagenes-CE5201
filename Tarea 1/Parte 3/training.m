function [S, U, r, xi, f] =training()
  %Lista de archivos en el directorio
  files = glob('.\Database\*.png');
  %Lectura de la imagen para obtener variables
  sampleImage = imread(char(files(1,1)));
  %Tamano del vector imagen que se va a crear
  imgSize = size(sampleImage,1) * size(sampleImage,2);
  %Cantidad de archivos en el directorio 
  fileLength = length(files);

  S = zeros(imgSize,fileLength/9);

  faceCtr = 1;

  indvCtr = 1;

  tempImg = zeros(size(sampleImage));

  for k = 1:fileLength
    if faceCtr < 9
      tempImg += im2double(imread(char(files(k,1))));
      ++faceCtr;
    else
      tempImg += im2double(imread(char(files(k,1))));
      S(:,indvCtr) = tempImg(:)/9;
      tempImg = zeros(size(sampleImage));
      faceCtr = 1;
      ++indvCtr;
    end
  endfor

  f = mean(S,2);

  A =  S - f;

  r = size(A,2);

  [U,Ss,V] = svd(A);

  xi = U(:,1:r)' * A ;

endfunction





