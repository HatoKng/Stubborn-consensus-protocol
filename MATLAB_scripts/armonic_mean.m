function H = armonic_mean(x0)
    N = length(x0);
    reciprocal_sum = sum(1 ./ x0); 
    H = N / reciprocal_sum;
end