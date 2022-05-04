function B = mymedian(A)
[M,N] = size(A);
A = double(A);
for x = 2:M-1
    for y = 2:N-1
    B(x,y) = median([A(x-1,y-1) , A(x-1,y) , A(x-1,y+1)...
    , A(x,y-1) , A(x,y) , A(x,y+1)...
    , A(x+1,y-1) , A(x+1,y) , A(x+1,y+1)]);
    end
end
B = uint8(B);
end

