function A = generate_graph(N)
    % fully connected graph 
    A = ones(N) - eye(N); 

    A= [1 0 0 1 1 1;
        0 1 1 0 1 0;
        0 1 1 0 0 1;
        1 0 0 1 1 0;
        1 1 0 1 1 0;
        1 0 1 0 0 1];

    % UNDIRECTED GRAPH
    % A = [0 1 1 0 0 0;
    %      1 0 1 1 0 0;
    %      1 1 0 0 1 0;
    %      0 1 0 0 1 1;
    %      0 0 1 1 0 1;
    %      0 0 0 1 1 0];

    % BALANCED DIRECTED GRAPH
    % A= [0 1 0 0 0 0;
    %     1 0 0 1 0 0;
    %     0 1 0 0 0 0;
    %     0 0 1 0 0 1;
    %     0 0 0 0 0 1;
    %     0 0 0 1 1 0];

    % NON DIAGONALIZABLE BALANCED CONNECTED DIRECTED GRAPH
    % A= [2 2 0 0 0 0;
    %     0 2 2 0 0 0;
    %     0 0 2 2 0 0;
    %     0 0 0 2 2 0;
    %     0 0 0 0 2 2;
    %     2 0 0 0 0 2];

    % NON BALANCED CONNECTED DIRECTED GRAPH
    % A = [0 1 0 0 0 0;
    %  0 0 1 0 0 0;
    %  1 0 0 1 0 0;
    %  0 0 0 0 1 0;
    %  0 0 0 0 0 1;
    %  0 0 0 0 0 0];


end