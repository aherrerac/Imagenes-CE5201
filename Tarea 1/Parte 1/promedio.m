function Y = promedio(A)
    %Tamaño de la matriz 
    [m,n,c]= size(A);
    %Nueva matriz de ceros con tamano igual al anterior 
    Y = zeros(m,n,c);
    %Se pasa la matriz a formato double
    A = im2double(A);

    %Se evaluan las esquinas por separado
    %Esquina (1,1)
    x = 1;
    y = 1;
     %Comparacion de pixeles negros, 0.1 pixel negro
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        %Se promedian los 3 pixeles adyacentes
        Y(x,y,1:3) = (A(x,y+1,1:3) + A(x+1,y+1,1:3) + A(x+1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %Esquina(1,n)
    y = n;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x,y-1,1:3) + A(x+1,y-1,1:3) + A(x+1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %Esquina (m,1)
    x = m;
    y = 1;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x-1,y,1:3) + A(x-1,y+1,1:3) + A(x,y+1,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %Esquina (m,n)
    y = n;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x,y-1,1:3) + A(x-1,y-1,1:3) + A(x-1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
     %Calculo de los pixeles horizontales  
    x = 1; 
    for y = 2:n-1
        %Comparacion de pixeles negros
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            %Se promedian los 5 pixeles adyacentes, x = 1 
            Y(x,y,1:3) = (A(x,y-1,1:3) + A(x+1,y-1,1:3) + A(x+1,y,1:3) + A(x+1,y+1,1:3) + A(x,y+1,1:3))/5;
        else
            Y(x,y,:) = A(x,y,:);
        endif
    endfor
    for y = 2:n-1
        if or(A(m,y,1)<=0.1,A(m,y,2)<=0.1,A(m,y,3)<=0.1)
            % x = m 
            Y(m,y,1:3) = (A(m,y-1,1:3) + A(m-1,y-1,1:3) + A(m-1,y,1:3) + A(m-1,y+1,1:3) + A(m,y+1,1:3))/5;
        else
            Y(m,y,:) = A(m,y,:);
        endif
    endfor
    %Calculo de los pixeles verticales 
    y = 1; 
    for x = 2:m-1
         %Se promedian los 5 pixeles adyacentes, y = 1;
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            % y = 1;
            Y(x,y,1:3) = (A(x-1,y,1:3) + A(x-1,y+1,1:3) + A(x,y+1,1:3) + A(x+1,y+1,1:3) + A(x+1,y,1:3))/5;
        else
            Y(x,y,:) = A(x,y,:);
        endif 
    endfor
    % y = n;
    for x = 2:m-1
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            Y(x,n,1:3) = (A(x-1,n,1:3) + A(x-1,n-1,1:3) + A(x,n-1,1:3) + A(x-1,n-1,1:3) + A(x+1,n,1:3)) /5;
        else
            Y(x,n,:) = A(x,n,:);
        endif
    endfor
    %Se realiza el calculo del promedio de los 8 pixeles adyacentes
    for x = 2:m-1
        for y = 2:n-1
            if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
                Y(x,y,1:3) = (A(x-1,y-1,1:3) + A(x,y-1,1:3) + A(x+1,y-1,1:3) + A(x-1,y,1:3) + A(x+1,y,1:3) + A(x-1,y+1,1:3) + A(x,y+1,1:3) + A(x+1,y+1,1:3) )/8;
            else
                Y(x,y,:) = A(x,y,:);
            endif
        endfor
    endfor  
endfunction    


