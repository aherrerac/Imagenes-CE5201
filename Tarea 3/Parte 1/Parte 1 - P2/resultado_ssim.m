clc; clear; close all
pkg load image

####Pregunta 3
%%probando similitud entre paisaje original 
%% e imagen recuperada con algoritmo SSIM

%%cargando paisaje
A=imread('paisaje.jpg');

%%cargando imagen recuperada
B=imread('paisaje_restaurado.jpg');

%%obteniendo resultado del algoritmo SSIM y mostrandolo
[c, x]=ssim(A,B);

disp('');disp('');disp('Pregunta 3');
disp('La similud entre la imagen original y la recuperada, segun SSIM es:');
c

####Pregunta 4
%%probando similitud entre image original
%% e imagen recuperada con algoritmo SSIM

%%cargando imagen original
A=imread('imgOriginal.jpg');

%%cargando imagen recuperada
B=imread('imgRecuperada.jpg');

%%obteniendo resultado del algoritmo SSIM y mostrandolo
[c, x]=ssim(A,B);

disp('');disp('');disp('Pregunta 4');
disp('La similud entre la imagen original y la recuperada, segun SSIM es:');
c