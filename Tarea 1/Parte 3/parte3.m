clc; 
[S,U,r,xi,f] = training();
%S: Matriz con las imagenes de entrenaiento promediadas
%U: Vector U de SVD de la matriz original menos los promedios
%r: Rango de la matriz A 
%xi: Vectores coordenados de las imagenes
%f: Matriz promedio de caras

files = glob('.\Comparar\*.png');

%Calculo de los epsilon a prueaba y error
e0 = 10;
e1 = 11;

figure('Name','Mean Image');
  
imshow(reshape(f,[112 92]));
  
figure('Name','Facial Recognition SVD');

for k = 1:40
     
  image = im2double(imread(char(files(k,1))));
  
  %Imagen menos el promedio de las caras 
  fi = image(:) -f;
  %Calculo de los vectores coordenados de la imagen anterior
  x = U(:,1:r)' * fi;
  %Calculo del epsilon 
  ef = ((fi - U(:, 1:r) * x)' * (fi - U(:, 1:r) * x)) ^ 0.5;
  
  ei = zeros(40,1);
  
  if ef < e1
    for l = 1:40
      ei(l,1)= ((x - xi(:,l))' * (x - xi(:,l))) ^ 0.5;
    endfor
    
    [val idx] = min(ei);
    
    if val < e0
      subplot(1,2,1);
      imshow(image);
      title('Face');
      
      subplot(1,2,2);
      imshow(reshape(S(:,idx),size(image)));
      title('Similar Mean Face');
      pause(1.5);
    else
       disp('Not a know image');
    end
  else
    disp('Not a image'); 
  end
  
endfor







