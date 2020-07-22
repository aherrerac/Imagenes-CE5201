clc; clear
pkg load image
pkg load video


V_plane=VideoReader('video_avion.mp4');

V_sky=VideoReader('video_cielo.mp4');

m = V_plane.Height;
n = V_plane.Width;
c = V_plane.NumberOfFrames;

video=VideoWriter('vide_croma.mp4');


tic
for k = 1:c
  writeVideo(video,parte2_p4_aux(readFrame(V_plane),readFrame(V_sky)));
endfor
toc

close(video);
