function Y = promedio(A)
    %Size
    [m,n,c]= size(A);
    %New zeros filled matrix
    Y = zeros(m,n,c);

    A = im2double(A);

    %Corner
    % (1,1)
    x = 1;
    y = 1;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x,y+1,1:3) + A(x+1,y+1,1:3) + A(x+1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %(1,n)
    y = n;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x,y-1,1:3) + A(x+1,y-1,1:3) + A(x+1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %(m,1)
    x = m;
    y = 1;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x-1,y,1:3) + A(x-1,y+1,1:3) + A(x,y+1,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif
    %(m,n)
    y = n;
    if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
        Y(x,y,1:3) = (A(x,y-1,1:3) + A(x-1,y-1,1:3) + A(x-1,y,1:3))/3;
    else
        Y(x,y,:) = A(x,y,:);
    endif

    %Horizontal 
    x = 1; 
    for y = 2:n-1
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            % x = 1 a
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
    %Vertical 
    y = 1; 
    for x = 2:m-1
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            % y = 1;
            Y(x,y,1:3) = (A(x-1,y,1:3) + A(x-1,y+1,1:3) + A(x,y+1,1:3) + A(x+1,y+1,1:3) + A(x+1,y,1:3))/5;
        else
            Y(x,y,:) = A(x,y,:);
        endif 
    endfor
    % y = n;
    % y = 1;
    for x = 2:m-1
        if or(A(x,y,1)<=0.1,A(x,y,2)<=0.1,A(x,y,3)<=0.1)
            Y(x,n,1:3) = (A(x-1,n,1:3) + A(x-1,n-1,1:3) + A(x,n-1,1:3) + A(x-1,n-1,1:3) + A(x+1,n,1:3)) /5;
        else
            Y(x,n,:) = A(x,n,:);
        endif
    endfor


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


