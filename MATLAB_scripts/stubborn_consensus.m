function x_hist = stubborn_consensus(A, x0, T)
    N = length(x0);
    x_hist = zeros(N, T);
    x_hist(:, 1) = x0;
    y_hist = zeros(N, T);
    y_hist(:, 1) = 1 ./ x0;

    D = diag(sum(A,2));
    L = D - A;
    L = L / max(eig(D)); %Normalization

    % Check rank condition
    assert(rank(L) == N-1, 'rank(L) is not N-1') 

    % Check balanced condition
    outdeg = sum(A,2);    % row sums
    indeg  = sum(A,1)';   % column sums
    assert(isequal(outdeg, indeg), 'Graph is not balanced');

    for t = 1:T
        y_hist(:, t+1) = y_hist(:, t) - L*y_hist(:, t); 
        x_hist(:,t+1) = 1 ./ y_hist(:,t+1);
    end

end