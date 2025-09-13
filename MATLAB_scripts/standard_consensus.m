function x_hist = standard_consensus(A, x0, T)
    N = length(x0);
    x_hist = zeros(N, T);
    x_hist(:, 1) = x0;

    D = diag(sum(A,2));
    L = D - A;
    L = L / max(eig(D)); %Normalization

    for t = 1:T
        x_hist(:, t+1) = x_hist(:, t) - L*x_hist(:, t); 
    end
end