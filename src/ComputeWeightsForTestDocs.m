function queriesWeights = ComputeWeightsForTestDocs(testTermDocs , IDF)
% Computes and returns the weights of the queries.

[rows , cols] = size(testTermDocs);

%Initialize an empty W matrix.
queriesWeights = zeros( 1, rows);

%Compute W matrix.
for t = 1 : rows
    for q = 1 : cols
        if testTermDocs(t,q) > 0
            queriesWeights(t,q) = IDF(t);
        end
    end
end

end