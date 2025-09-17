function A = generate_graph(N)
    % fully connected graph 
    A = ones(N) - eye(N); 

    % A= [0 0 0 1 1 1 1;
    %     0 0 1 0 1 0 1;
    %     0 1 0 0 0 1 1;
    %     1 0 0 0 1 0 1;
    %     1 1 0 1 0 0 1;
    %     1 0 1 0 0 0 1;
    %     1 1 1 1 1 1 0];

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
    % A= [1 1 0 0 0 0;
    %     0 1 1 0 0 0;
    %     0 0 1 1 0 0;
    %     0 0 0 1 1 0;
    %     0 0 0 0 1 1;
    %     1 0 0 0 0 1];

    % NON BALANCED CONNECTED DIRECTED GRAPH
    % A = [0 1 0 0 0 0;
    %  0 0 1 0 0 0;
    %  1 0 0 1 0 0;
    %  0 0 0 0 1 0;
    %  0 0 0 0 0 1;
    %  0 0 0 0 0 0];

    % BALANCED ROOTED-OUT BRANCHING DIRECTED GRAPH
    % A= [0 1 0 1 0 0;
    %     0 0 1 0 1 0;
    %     0 0 0 1 0 1;
    %     1 0 0 0 1 0;
    %     0 1 0 0 0 1;
    %     1 0 1 0 0 0];


end