function RESULTS =  RetrieveDocuments( scores , docIDs , queriesIDs )
% This function retrives the 500 most relevant documents for each query.
% The results are written in the 'corelResults.txt' in trec_eval's format.

%Get the dimensions of 'scores' array.
[rows , cols] = size(scores);

% Open the output file.
file = fopen('corelResults.txt' , 'w');

% A matrxi that will keep the results of the retrieval , in trec_eval
% format. This will be a 249000 * 6 matrix
RESULTS = cell(size(scores , 1)*500 , 6);

% For each query...
for q = 1 : rows
    
    %docs is a 4500*2 array which holds the scores of the current query q
    %with all the documents in the first column , and in the second one ,
    %keeps the number of the associate document.
    
	%Get all the scores of the current query with all the documents.
    docs(1:cols , 1:1) = scores(q:q , 1:cols);
    
    %Associate the documents scores with the document numbers.
    docs(1:cols , 2:2) = (1:cols);
    
	%Get the id of the current query.
    queryID = cell2mat ( queriesIDs(q  , 1) );

    %Sort the documents according to the highest score.
    docs = sortrows(docs , -1);
	
    %Write the 500 most relevant documents in the file , using trec_eval's format.
    for i = 1 : 500
         docID = cell2mat ( docIDs(docs(i , 2)  , 1) );
        
        RESULTS{ 500 * (q-1) + i , 1} = queryID;
        RESULTS{ 500 * (q-1) + i , 2} = 'Q0';
        RESULTS{ 500 * (q-1) + i , 3} = docID;
        RESULTS{ 500 * (q-1) + i , 4} = i;
        RESULTS{ 500 * (q-1) + i , 5} = docs(i,1);
        RESULTS{ 500 * (q-1) + i , 6} = 'STANDARD';
        
        fprintf(file ,  '%s  %s  %s  %i  %f  %s\n',  queryID , 'Q0' ,  docID , i  , docs(i , 1) , 'STANDARD');
    end
end 

fclose(file);
end