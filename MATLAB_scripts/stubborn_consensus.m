function [z_hist,y_hist, tvec] = stubborn_consensus(A, x0,v0, T, converge_and_move)
    
    dt = 0.01;               
    tvec = 0:dt:T;         
    Nt   = numel(tvec);

    N = length(x0);    


    D = diag(sum(A,2));
    L = D - A;

    % Check rank condition
    assert(rank(L) == N-1, 'rank(L) is not N-1') 

    % Check balanced condition
    outdeg = sum(A,2);    
    indeg  = sum(A,1)';  
    assert(isequal(outdeg, indeg), 'Graph is not balanced');

    if isempty(v0)
        
        z_hist = zeros(N, Nt);
        y_hist = zeros(N, Nt);
        y0 = 1 ./ x0;
        A_cl = -L;

    else

        assert(length(v0) == N);
        z_hist = zeros(2*N, Nt);
        z0 = [x0; v0];
        y0 = zeros(2*N,1);
        y0(1:N) = 1 ./ x0;
        y0(N+1:2*N)= -v0 ./ (x0.^2);
  

        if ~converge_and_move
            k=2;
            A_cl = [zeros(N)      eye(N);    
                     -L     -k*eye(N)];       % put -L instead of -k*eye(N) if want
                                              % convergence + moving at same velocity 
    
            s_1 = [ones(N,1); zeros(N,1)];
            q_1 = 1/(k*N)*[k*ones(N,1); ones(N,1)];
   
    
            y_stubborn_conv_val = (q_1' * y0) * s_1;
            x_stubborn_conv_val = zeros(2*N,1);
            x_stubborn_conv_val(1:N) = 1./y_stubborn_conv_val(1:N);
            y_dot = y_stubborn_conv_val(N+1:2*N);
     
            x_stubborn_conv_val(N+1:2*N) = -y_dot ./ (y_stubborn_conv_val(1:N).^2)
            x_stubborn_conv_val;

        else
            A_cl = [zeros(N)      eye(N);    
                 -L     -L];  
        end


    end
   

    for k = 1:Nt
        t = tvec(k);
        y_hist(:,k) = expm(A_cl*t) * y0;  % continous-time form
        y_dot = y_hist(N+1:2*N,k);
        z_hist(1:N,k) = 1 ./ y_hist(1:N,k);
        z_hist(N+1:2*N,k) = -y_dot ./ (y_hist(1:N,k).^2);
    end


    if isempty(v0)
        % Disp the connectivity eigenvalue
        lambda = eig(L);        
        lambda = sort(lambda);  
        lambda2_stubborn = lambda(2)
    end

end