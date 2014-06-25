function score = ComputeScoresVSM( trainDocs , trainDocsWeights , testDocs,  testDocsWeights )
% This function computes the scores(similarity) between all queries and all documents.

% The number of rows of the scores matrix will be 
% the number of columns of the queries matrix.
% i.e 499.
rows = size(testDocsWeights , 2);

% The number of columns of the scores matrix will be 
% the number of columns of the documents matrix.
% i.e 4500.
cols = size(trainDocsWeights , 2);

%Initialize a 499*4500 matrix with zeros.
score = zeros(rows , cols);


% For all the queries...
for q = 1 : rows
	
	%Get the current query.
    query = testDocs(1:size(testDocsWeights,1) , q:q);
    
	%Get all the weights of the current query. 
	queryWeights = testDocsWeights(1:size(testDocsWeights,1) , q:q);
    
	%For all the documents...
    for d = 1 : cols
        
		%Get the current document.
		document = trainDocs(1:size(trainDocsWeights,1) , d:d);  
        
		%Get the weights of the current document.
		documentWeights = trainDocsWeights(1:size(trainDocsWeights,1) , d:d);
        
		%Compute the common terms between the document and the query.
        commonTerms = query.'*document;
        
		%If the query and the document have no common terms , the score between them will be 0.
        if commonTerms == 0
            score(q,d) = 0;
		%Otherwise , the score will be ( qT*d / ||q|| * ||d|| ).
        else
            queryNorm = norm(queryWeights , 'fro');
            docNorm = norm(documentWeights , 'fro');
            score(q,d) = (queryWeights.'*documentWeights)/(queryNorm*docNorm);
        end
    end
end
end