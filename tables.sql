CREATE TABLE IF NOT EXISTS Charts_metadata (Id INTEGER PRIMARY KEY, Chart_name TEXT, Date TEXT, For TEXT, By TEXT, Subject TEXT);

CREATE TABLE IF NOT EXISTS Charts_figures (Id INTEGER PRIMARY KEY, Id_Charts_metadata INTEGER, Position TEXT, Fire INTEGER, Air INTEGER, Water INTEGER, Earth INTEGER);

CREATE TABLE IF NOT EXISTS Figures (ID INTEGER PRIMARY KEY, Number INTEGER, Name TEXT, Translation TEXT, Figure TEXT);

		db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1111, 'Via', 'Way');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1112, 'Cauda Draconis', 'Tail of the Dragon');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1121, 'Puer', 'Boy');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1122, 'Fortuna Minor', 'Lesser Fortune');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1211, 'Puella', 'Girl');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1212, 'Amissio', 'Loss');"
			db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1221, 'Carcer', 'Prison');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (1222, 'Laetitia', 'Joy');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2111, 'Caput Draconis', 'Head of the Dragon');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2112, 'Conjunctio', 'Conjunction');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2121, 'Acquisitio', 'Gain');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2122, 'Rubeus', 'Red');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2211, 'Fortuna Major', 'Greater Fortune');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2212, 'Albus', 'White');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2221, 'Tristitia', 'Sorrow');"
		    db.execute "INSERT INTO Figures (Number, Name, 
		    Translation)
		    VALUES (2222, 'Populus', 'People');"

		    db.execute "UPDATE Figures SET Figure = 
		    ' * \\r * \\r * \\r * ' WHERE ID = 1;"
		    db.execute "UPDATE Figures SET Figure = 
		    ' * \\r * \\r * \\r* *' WHERE ID = 2;"
		    db.execute "UPDATE Figures SET Figure = 
		    ' * \\r * \\r* *\\r * ' WHERE ID = 3;"
		    db.execute "UPDATE Figures SET Figure =  
		    ' * \\r * \\r* *\\r* *' WHERE ID = 4;"
		    db.execute "UPDATE Figures SET Figure =  
		    ' * \\r* *\\r * \\r * ' WHERE ID = 5;"
		    db.execute "UPDATE Figures SET Figure =  
		    ' * \\r* *\\r * \\r* *' WHERE ID = 6;"
			db.execute "UPDATE Figures SET Figure =  
		    ' * \\r* *\\r* *\\r * ' WHERE ID = 7;"
		    db.execute "UPDATE Figures SET Figure =  
		    ' * \\r* *\\r* *\\r* *' WHERE ID = 8;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r * \\r * \\r * ' WHERE ID = 9;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r * \\r * \\r* *' WHERE ID = 10;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r * \\r* *\\r * ' WHERE ID = 11;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r * \\r* *\\r* *' WHERE ID = 12;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r* *\\r * \\r * ' WHERE ID = 13;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r* *\\r * \\r* *' WHERE ID = 14;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r* *\\r* *\\r * ' WHERE ID = 15;"
		    db.execute "UPDATE Figures SET Figure =  
		    '* *\\r* *\\r* *\\r* *' WHERE ID = 16;"