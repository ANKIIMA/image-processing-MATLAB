function B = myhisteq(A)
hist_A = imhist(A);
muA = hist_A ./ sum(hist_A);
accmuA = zeros(1,256);
accmuA(1) = muA(1);
for i=2:size(muA)
    accmuA(i) = accmuA(i-1) + muA(i);
end
S = round(accmuA * 255);
B = uint8(S(A));
end

