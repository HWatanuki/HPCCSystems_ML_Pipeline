IMPORT $,ML_Core;
// 5,000 records for the training sample
myTrainData := $.modPrep.myDataPrep[1..5000];  
// 2,000 records for the test sample
myTestData  := $.modPrep.myDataPrep[5001..7000]; 
																	
// Converting the cleaned data to numeric field
ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
// OUTPUT(myTrainDataNF);
// OUTPUT(myTestDataNF);
EXPORT modSeg := MODULE;
  EXPORT myIndTrainDataNF := myTrainDataNF(number < 10); 
     
	EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 10), 
																		 TRANSFORM(RECORDOF(LEFT), 
																							SELF.number := 1,
                                              SELF := LEFT));
         			 
	EXPORT myIndTestDataNF := myTestDataNF(number < 10); 
       
  EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 10), 
                                    TRANSFORM(RECORDOF(LEFT), 
                                              SELF.number := 1,
                                              SELF := LEFT));
END;
