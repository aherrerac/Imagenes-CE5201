clc; 
[S,U,r,xi,f] = training();

files = glob('.\Comparar\*.png');

e0 = 10;
e1 = 11;

for k = 1:40
     
  image = im2double(imread(char(files(k,1))));
  fi = image(:) -f;
  
  x = U(:,1:r)' * fi;
  
  ef = ((fi - U(:, 1:r) * x)' * (fi - U(:, 1:r) * x)) ^ 0.5
  
  e = zeros(40,1);
  
  if ef < e1
    for l = 1:40
      ei(l,1)= ((x - xi(:,l))' * (x - xi(:,l))) ^ 0.5;
    endfor
    
    [val idx] = min(ei);
    
    if val < e0
      subplot(1,2,1);
      imshow(image);
      subplot(1,2,2);
      imshow(reshape(S(:,idx),size(image)));
      pause(1.5);
    else
       disp('Not know image');
    end
  else
    disp('Not a image'); 
  end
  
endfor







