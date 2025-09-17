function [z_hist, tvec] = weighted_consensus(A, x0, v0, T, converge_and_move)
    dt = 0.01;                
    tvec = 0:dt:T;          
    Nt   = numel(tvec);

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

    if isempty(v0)
        
        z_hist = zeros(N, Nt);
        z0 = x0;
        A_cl = -L;

    else

        assert(length(v0) == N);
        z_hist = zeros(2*N, Nt);
        z0 = [x0; v0];

        if ~converge_and_move
        k=2;
        A_cl = [zeros(N)      eye(N);    
                 -L     -k*eye(N)];       % put -L instead of -k*eye(N) if want
                                          % convergence + moving at same velocity 
        else
            A_cl = [zeros(N)      eye(N);    
                 -L     -L];  
        end
    end
    
    
    for k = 1:Nt
        t = tvec(k);
        z_hist(:,k) = expm(A_cl*t) * z0;  % continous-time form 
    end
    

    if isempty(v0)
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

    elseif ~converge_and_move
        [P,J] = jordan(A_cl);             
        p_1 = real(P(:,1));       
        Q = inv(P);
        q_1 = real(Q(1,:));  
        general_weighted_conv_value = (q_1 * z0) .* p_1

    end

    
end