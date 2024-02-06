IMPORT $;

Property := $.modFile.File;
// Crosstab report of average price per state
OutRec := RECORD
	Property.state;
	UNSIGNED4 avg_value := AVE(GROUP,Property.total_value);
END;
EXPORT XTAB_PriceState := TABLE(Property,OutRec,state);

