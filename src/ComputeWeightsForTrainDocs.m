function [documentsWeights , IDF] = ComputeWeightsForTrainDocs(trainTermDocs)
% Computes the weights of the train documents and returns them , 
% together with the IDF matrix.


[rows , cols] = size(trainTermDocs);


% FIRST WE NEED TO COMPUTE THE TF MATRIX

%Initialize an empty TF matrix.
TF = zeros( rows , cols);

%Compute TF matrix.
for t = 1 : rows
    for d = 1 : cols
        %TF(t,d) = sqrt(count(t,d)) , count(t,d) = X(t,d) = trainTermDocs(t,d). 
        TF(t,d) = sqrt(abs(trainTermDocs(t,d)));
    end
end



% NOW WE WILL COMPUTE THE df(t) MATRIX %

%Initialize an empty df matrix.
df = zeros( 1, rows);

%Compute df matrix.
for t = 1 : rows
        total = 0;
       for d = 1 : cols
           if trainTermDocs(t,d) ~= 0
               total = total +1;
           end
       end
       df(t) = total;
end



% THEN WE WILL COMPUTE THE IDF(t) MATRIX %

%Initialize an empty idf matrix.
IDF = zeros( 1, rows);

%Compute idf matrix.
for t = 1 : rows
    IDF(t) = 1 + log( cols / df(t) );
end



% FINALLY WE WILL COMPUTE THE W(t , d) MATRIX %

%Initialize an empty W matrix.
documentsWeights = zeros( 1, rows);

%Compute W matrix.
for t = 1 : rows
    for d = 1 : cols
        documentsWeights(t,d) = TF(t,d)*IDF(t);
    end
end

end