function X = parte2_p4_aux(A,B);
  %Creacion de la mascara para fondos verdes
  mask = and(A(:,:,1) <= 0.5 , A(:,:,2) >= 0.55 , A(:,:,3) <= 0.5);

  new_A = A;

  %r
  new_Ar = A(:,:,1);
  new_Ar(mask) = B(:,:,1)(mask);
  %g
  new_Ag = A(:,:,2);
  new_Ag(mask) = B(:,:,2)(mask);
  %b
  new_Ab = A(:,:,3);
  new_Ab(mask) = B(:,:,3)(mask);

  %Cambio de todos los canales
  new_A(:,:,1) = new_Ar;
  new_A(:,:,2) = new_Ag;
  new_A(:,:,3) = new_Ab;  
  
  mask_n = !mask; %Negativo de la máscara, cambio para visualizacion

  m_mask = [0 1 0; 1 1 1; 0 1 0];

  dilate = imdilate(mask_n,m_mask);

  rode = imerode(mask_n,m_mask);

  edge = dilate&~rode;
  
  X = inpainting(new_A,edge,0.5);
endfunction
