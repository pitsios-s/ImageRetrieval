function [ words , train , test] = Preproccesing( Words , TrainDocs , TestDocs )
% The last three words of the "words" matrix do not appear in the training docs.
% So we need to remove them from the collection.
% This function performs the above operation.

words = Words(1:371 , 1:1);
train = TrainDocs(1:371 , 1:4500);
test = TestDocs(1:371 , 1:499);

end