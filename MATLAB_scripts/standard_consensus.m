function [x_hist, tvec] = standard_consensus(A, x0, T)
    N = length(x0);

    D = diag(sum(A,2));
    L = D - A;

    dt = 0.01;                
    tvec = 0:dt:T;           
    Nt   = numel(tvec);
    
    x_hist = zeros(N, Nt);
    for k = 1:Nt
        t = tvec(k);
        x_hist(:,k) = expm(-L*t) * x0;  % continous-time form 
    end

    % Disp the connectivity eigenvalue
    lambda = eig(L);        
    lambda = sort(lambda);  
    lambda2_standard = lambda(2)
end