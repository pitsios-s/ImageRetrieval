function score = ComputeScoresLSI(trainDocs , testDocs)
% This function computes the scores(similarity) between all queries and all documents.

% The number of rows of the scores matrix will be 
% the number of columns of the queries matrix.
% i.e 499.
rows = size(testDocs , 2);

% The number of columns of the scores matrix will be 
% the number of columns of the documents matrix.
% i.e 4500.
cols = size(trainDocs , 2);

%Initialize a 499*4500 matrix with zeros.
score = zeros(rows , cols);


% For all the queries...
for q = 1 : rows
	
	%Get the current query.
    query = testDocs(1:size(testDocs,1) , q:q);
        
	%For all the documents...
    for d = 1 : cols
        
		%Get the current document.
		document = trainDocs(1:size(trainDocs,1) , d:d);  
                     
        queryNorm = norm(query , 'fro');
        docNorm = norm(document , 'fro');
        score(q,d) = (query.'*document)/(queryNorm*docNorm);
       
    end
end
end