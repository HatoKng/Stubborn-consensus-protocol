function [x_hist, tvec] = weighted_consensus(A, x0, T)
    N = length(x0);
    
    %% BUILDING THE WEIGHT MATRIX
    w = 1 ./ abs(x0);     % weights as the inverse of the initial positions
    W = zeros(N);
    for i = 1:N
        for j = 1:N
            W(i,j) = A(i,j) *w(j);
        end
        % normalization of W
        row_sum = sum(W(i,:));

        if row_sum ~=0
            W(i,:) = W(i,:) / row_sum;
        end
    end
   
    % using the weighted matrix instead of the Adiacency matrix
    % in the classical consensus protocol
    D = diag(sum(W,2)); % D is the Identity because W is row-stochastic
    L = D - W;

    % Check rank condition
    assert(rank(L) == N-1, 'rank(L) is not N-1') 

    dt = 0.01;                
    tvec = 0:dt:T;          
    Nt   = numel(tvec);
    
    x_hist = zeros(N, Nt);
    for k = 1:Nt
        t = tvec(k);
        x_hist(:,k) = expm(-L*t) * x0;  % continous-time form 
    end
    
    % Jordan decomposition
    [P,J] = jordan(L);             
    p_1 = real(P(:,1));       
    Q = inv(P);
    q_1 = real(Q(1,:));  


    % Imposing an orthogonal normalization between the eigenvectors we can
    % express the convergence value as a linear combination of the inputs
    % weighted by a stationary distribution pi

    p_1 = p_1 ./ p_1/(1);            % guarantee p_1 = 1
    pi = q_1 / sum(abs(q_1));        % guarantee pi * p_1 = 1

    weighted_convergence_value = (pi * x0)

    general_non_normalized_value = (q_1 * x0) .* p_1;

    % Disp the connectivity eigenvalue
    lambda = eig(L);        
    lambda = sort(lambda);  
    lambda2_weighted = lambda(2)
    
end