// *****
// ECL (Enterprise Control Language) is a programming language for Big Data query and manipulation.
// It follows a declarative paradigm, is strongly typed and compiled (C++).
// *****

// *****
// Basic ECL syntax 
// A definition
// Mydef := 'Hello World';  // "value" type defitinion
// An action
// OUTPUT('Hello World');
// OUTPUT(mydef);

// *****
// Basic data structures in ECL
// RECORD structure
// rec := RECORD
  // STRING10  Firstname;
	// STRING10  Lastname;
	// STRING1   Gender;
	// UNSIGNED1 Age;
	// INTEGER   Balance;
	// DECIMAL7_2 Income;
// END;

// DATASET declaration
// ds := DATASET([{'Alysson','Smith','M',26,100,1000.50},
               // {'Bryan','Camargo','',22,-100,500.00},
							 // {'Elaine','Taylor','F',19,-50,750.60},
							 // {'July','Simpson','F',45,500,5000},
							 // {'Orion','Taylor','M',67,300,4000}],rec);
// OUTPUT(ds);

// *****
// Dataset filtering
// recset := ds(Age<65);
// recset; //Equivalent to: OUTPUT(recset);

// recset := ds(Age<65,Gender='M');
// recset;

// IsSeniorMale := ds.Age>65 AND ds.Gender='M'; // "boolean" type definition
// recset := ds(IsSeniorMale);
// recset;

// SetGender := ['M','F'];  // "set" type definition
// recset := ds(Gender IN SetGender);
// recset;						//  "recordset" type definition
// COUNT(recset);    //Equivalent to: OUTPUT(COUNT(recset));

// *****
// Basic transformations in ECL
// Removing unnecessary fields
// tbl := TABLE(ds,{Firstname,LastName,Income});
// tbl;

// Sorting records
// sortbl := SORT(tbl,LastName);
// sortbl;

// Removing duplicated records
// dedptbl := DEDUP(sortbl,LastName);
// dedptbl;

// Adding a field to the dataset
// newrec := RECORD
  // UNSIGNED   recid;  
	// STRING10   Firstname;
	// STRING10   Lastname;
	// STRING1    Gender;
	// UNSIGNED1  Age;
	// INTEGER    Balance;
	// DECIMAL7_2 Income;
// END;

// IMPORT STD;

// newrec MyTransf(rec Le, UNSIGNED cnt) := TRANSFORM
  // SELF.recid:=cnt;
	// SELF.Firstname := STD.Str.ToUpperCase(Le.Firstname);
	// SELF.Lastname := STD.Str.ToUpperCase(Le.Lastname);
  // SELF := Le;
// END;

// newds := PROJECT(ds,MyTransf(LEFT,COUNTER));

// newds;


// rec2 := RECORD
	// STRING10   Firstname;
	// STRING10   Lastname;
	// STRING10   Email;

// END;


// ds2 := DATASET([{'ALYSSON','SMITH','alysson.smith@gmail.com'},
               // {'BRYAN','CAMARGO','bryan.camargo@gmail.com'},
							 // {'ELAINE','TAYLOR','elaine.taylor@gmail.com'},
							 // {'JULY','SIMPSON','july.simpson@gmail.com'},
							 // {'ORION','TAYLOR','oryon.taylor@gmail.com'}],rec2);

// OUTPUT(ds2);

// Fazendo JOIN de datasets
// rec3 := RECORD
  // newrec;
  // rec2.Email;
// END;

// rec3 MyTransf2(newrec Le, rec2 Ri) := TRANSFORM
  // SELF := Le;
  // SELF := Ri;
// END;

// joineds := JOIN(newds,ds2,LEFT.Firstname=RIGHT.Firstname AND LEFT.Lastname=RIGHT.Lastname,MyTransf2(LEFT,RIGHT));
// joineds;


 
   rec := RECORD
     STRING firstname;
   	 STRING lastname;
   	 UNSIGNED age;
   END;
   
   ds := DATASET([{'Wendy','Frost',34},
                  {'Albert','John',34},
   							 {'Natan','Bun',45},
   							 {'Carl','Moore',56},
   							 {'Jimmy','John',66}]
   							 ,rec);
   OUTPUT(ds); // this OUTPUT exemplifies a dataflow parallelism to be shown via the graphs
   
   mysort1 := SORT(ds,firstname);  //this sort will be ignored by the compiler unless you explicitely asks for its OUTPUT as this sort does not affect the end result
   																// (exemplifies a dataflow optimization to be shown via the graphs)
   // OUTPUT(mysort1); 
   
   mysort2 := SORT(mysort1,lastname); //this sort will actually only be done after the filter is applied since the compiler understands that only a subset of data needs to be sorted by then 
                                      // (exemplifies another dataflow optimization to be shown via the graphs)
   
   myfilter := mysort2(age>50); 
   OUTPUT(myfilter);
   



// https://hpccsystems.com/training/documentation/learning-ecl/
// https://hpccsystems.com/training/
// https://www.amazon.com/dp/B0CNWTPDH1?binding=kindle_edition&ref=dbs_m_mng_rwt_sft_tkin_tpbk






