function [z_hist, tvec] = standard_consensus(A, x0, v0, T, converge_and_move)

    dt = 0.01;                
    tvec = 0:dt:T;           
    Nt   = numel(tvec);

    N = length(x0);

    D = diag(sum(A,2));
    L = D - A;

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

        s_1 = [ones(N,1); zeros(N,1)];
        q_1 = 1/(k*N)*[k*ones(N,1); ones(N,1)];

        standard_conv_val = (q_1' * z0) * s_1
        
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
        % Disp the connectivity eigenvalue
        lambda = eig(L);        
        lambda = sort(lambda);  
        lambda2_standard = lambda(2)
    end
end