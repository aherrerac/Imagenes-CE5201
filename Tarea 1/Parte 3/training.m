function [S, U, r, xi, f] =training()
  files = glob('.\Database\*.png');

  sampleImage = imread(char(files(1,1)));

  imgSize = size(sampleImage,1) * size(sampleImage,2);

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





