ImageRetrieval
==============

A textual-based image retrieval project, implemented in matlab.

This project was developed for the purposes of the course 'Information Retrieval' of cs department, Athens University of Economics and Business, during the Winter semester 2013 - 2014.

The corel-5k datset was used for the implementation. The concept of the project is the following:
Given some words that can describe all the images of the collection, find the most "similar" ones matching some other images given as queries.

In order to retrieve relevant images, three different kinds of methods were used:
  * The classical Vector Space Model, 
  * The LSI and
  * A combination of the two methods above.
  
Finally the results were evaluated using the trec_eval program.

The whole project consists of the following three folders:
  * data : it contains all the data that are necessary for the implementation. Make sure you load all of them before running the code!
  * src : it contains the matlab source code of the project.
  * trec_eval_data : it contains the results of the program for both three methods stated above, as well as the evaluation of the results            comparing them to the actual correct answers.
  
  


##Running the project

* To run the VSM method, enter the src directory after having loaded all the necessary data and type :
 results =  InformationRetrievalVSM(words, trainTermDocs, testTermDocs, trainIDs, qIDs)

* To run the LSI method, type: results = InformationRetrievalLSI(words, trainTermDocs, testTermDocs, trainIDs, qIDs, k);
  where k is the number of dimension you want to keep.

* Finally, if you want to run the mixed method, type:
  results = InformationRetrievalLSI(words, trainTermDocs, testTermDocs, trainIDs, qIDs, k, w1, w2);
  where k is the number of dimension you want to keep and w1, w2 are the weights for VSM and LSI methods respectively.
