function [x_hist,y_hist, tvec] = stubborn_consensus(A, x0, T)
    N = length(x0);    
    y0 = 1 ./ x0;

    D = diag(sum(A,2));
    L = D - A;
 
    % Check rank condition
    assert(rank(L) == N-1, 'rank(L) is not N-1') 

    % Check balanced condition
    outdeg = sum(A,2);    
    indeg  = sum(A,1)';  
    assert(isequal(outdeg, indeg), 'Graph is not balanced');


    dt = 0.01;               
    tvec = 0:dt:T;         
    Nt   = numel(tvec);
    
    x_hist = zeros(N, Nt);
    y_hist = zeros(N, Nt);
    for k = 1:Nt
        t = tvec(k);
        y_hist(:,k) = expm(-L*t) * y0;  % continous-time form
        x_hist(:,k) = 1 ./ y_hist(:,k);
    end

    % Disp the connectivity eigenvalue
    lambda = eig(L);        
    lambda = sort(lambda);  
    lambda2_stubborn = lambda(2)

end