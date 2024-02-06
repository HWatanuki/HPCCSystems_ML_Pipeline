// *****
// Basic ECL syntax 
// A definition
// Mydef := 'Hello World';  // "value" type defitinion

// UmAn action
// OUTPUT('Hello Worl');
// OUTPUT(mydef);

// *****
// Basic data structures in ECL
// RECORD structure
rec := RECORD
  STRING10  Firstname;
	STRING    Lastname;
	STRING1   Gender;
	UNSIGNED1 Age;
	INTEGER   Balance;
	DECIMAL7_2 Income;
END;

// DATASET declaration
ds := DATASET([{'Alysson','Smith','M',26,100,1000.50},
               {'Bryan','Camargo','',22,-100,500.00},
							 {'Elaine','Taylor','F',19,-50,750.60},
							 {'July','Simpson','F',45,500,5000},
							 {'Orion','Lester','U',67,300,4000}],rec);
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
rec2 := RECORD
  UNSIGNED   recid;  
	STRING10   Firstname;
	STRING     Lastname;
	STRING1    Gender;
	UNSIGNED1  Age;
	INTEGER    Balance;
	DECIMAL7_2 Income;
END;

rec2 MyTransf(rec Le, UNSIGNED cnt) := TRANSFORM
  SELF.recid:=cnt;
  SELF := Le;
END;

newds := PROJECT(ds,MyTransf(LEFT,COUNTER));

//newds;













