function B = mylinear(A)
[M,N] = size(A);
A = double(A);
x = 2:M-1;
y = 2:N-1;
B(x,y) = (-A(x-1,y-1)  -A(x-1,y)  -A(x-1,y+1)...
     - A(x,y-1) + 8 * A(x,y) - A(x,y+1)...
     - A(x+1,y-1) - A(x+1,y) - A(x+1,y+1)) / 9;
 
 
B = [B,zeros(M-1,1);zeros(1,N)];
B = uint8(B);


end 