IMPORT $;
// Raw data
OUTPUT($.modFile.File);
COUNT($.modFile.File);

// Crosstab report
// OUTPUT($.XTAB_PriceState);

// Data preprocessing
// OUTPUT($.modPrep.MyDataPrep);
// COUNT($.modPrep.MyDataPrep);

// Training and test samples
// OUTPUT($.modSeg.myIndTrainDataNF, NAMED('IndTrainData')); 
// OUTPUT($.modSeg.myDepTrainDataNF, NAMED('DepTrainData')); 
// OUTPUT($.modSeg.myIndTestDataNF, NAMED('IndTestData')); 
// OUTPUT($.modSeg.myDepTestDataNF, NAMED('DepTestData')); 

// Validate function
// $.FN_GetPrice(95451,118720,2011,14774,1437,3,2,1,1968); //~130k
