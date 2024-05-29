IMPORT $;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;
// Selecting the algortihm
myLearnerR    := LT.RegressionForest(10,,10,[1]); 
// myLearnerR    := LT.RegressionForest(,,,[1]); 
// Get the trained model
myModelR      := myLearnerR.GetModel($.modSeg.myIndTrainDataNF,$.modSeg.myDepTrainDataNF);
//OUTPUT(myModelR,,'~mymodelXXX',NAMED('TrainedModel'),OVERWRITE); 
// Test the model
predictedDeps := myLearnerR.Predict(myModelR, $.modSeg.myIndTestDataNF);
OUTPUT(predictedDeps,NAMED('PredictedModel'));
// Assess the model
assessmentR   := ML_Core.Analysis.Regression.Accuracy(predictedDeps,$.modSeg.myDepTestDataNF);
OUTPUT(assessmentR,NAMED('ModelAssessment'));
