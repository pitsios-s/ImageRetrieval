function RESULTS = InformationRetrievalMIXED( words , documents , queries , docIDs , qIDs , k , w1 , w2)
%Given a 374*4500 term-document matrix and a 374*499 term-query matrix,
%returns a 499*4500 matrix of the results of the retrival that is in
%trec_eval format.



tSTART = tic;


%Preprocess the initial data.
[words , documents , queries] = Preproccesing(words , documents , queries);




%Compute the weights of the train documents.
[documentsWeights , IDF] = ComputeWeightsForTrainDocs(documents);

%Compute the weights of the queries.
queriesWeights = ComputeWeightsForTestDocs(queries , IDF);

%Compute the score matrix.
scoresVSM = ComputeScoresVSM(documents , documentsWeights , queries , queriesWeights);




%Compute the new document and query matrices , using the LSI method.
[documentsNEW , queriesNEW] = LSI(documents , queries , k);

%Compute the score matrix.
scoresLSI = ComputeScoresLSI(documentsNEW , queriesNEW);




%Get the 500 most relevant documents for each query.
scoresMIXED = ComputeMixedScores(scoresVSM , scoresLSI , w1 , w2);


%Get the 500 most relevant documents for each query.
RESULTS = RetrieveDocuments(scoresMIXED , docIDs , qIDs);



toc(tSTART);


end