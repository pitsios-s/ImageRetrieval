function [ documentsNEW , queriesNEW] = LSI( documents , queries , k )
%Given the documents and queries matrices and a value k , this function uses
%the svd method to compute the new matrices in a reduced dimension.


%Performs the svd decomposition by keeping only the k highest eigenvalues.
[U , S , V] = svds(documents , k);


% compute the new matrices.
documentsNEW = U.' * documents;
queriesNEW = U.' * queries;


end