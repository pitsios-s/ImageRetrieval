function scoresMIXED = ComputeMixedScores( scoresVSM , scoresLSI , w1 , w2 )
%computes a new similarity matrix , by using a combination of the
%similarity matrices of VSM and LSI methods.

scoresMIXED = (w1 * scoresVSM) + (w2 * scoresLSI);

end