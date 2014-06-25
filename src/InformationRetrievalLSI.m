function RESULTS = InformationRetrievalLSI( words , documents , queries , docIDs , qIDs , k )
%Given a 374*4500 term-document matrix and a 374*499 term-query matrix,
%returns a 499*4500 matrix of the results of the retrival that is in
%trec_eval format.



TSTART = tic;


%Preprocess the initial data.
[words , documents , queries] = Preproccesing(words , documents , queries);


%Compute the new document and query matrices , using the LSI method.
[documentsNEW , queriesNEW] = LSI(documents , queries , k);


%Compute the score matrix.
scoresLSI = ComputeScoresLSI(documentsNEW , queriesNEW);


%Get the 500 most relevant documents for each query.
RESULTS = RetrieveDocuments(scoresLSI , docIDs , qIDs);


toc(TSTART);


end