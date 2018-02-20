#!/usr/bin/ruby

require 'yaml'
require 'sqlite3'

#something to create database - DONE

begin
	db = SQLite3::Database.new "geomantic.db"
rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end

#creation of table - DONE

begin
	db = SQLite3::Database.open "geomantic.db"
    puts db.get_first_value 'SELECT SQLITE_VERSION()'
    db.execute "CREATE TABLE IF NOT EXISTS 
    	Charts (ID INTEGER PRIMARY KEY, 
    	Chart_name TEXT, Date TEXT, For TEXT, 
    	By TEXT, Subject TEXT, 
    	M1_fire   INTEGER, M1_air    INTEGER, 
    	M1_water  INTEGER, M1_earth  INTEGER, 
    	M2_fire   INTEGER, M2_air    INTEGER, 
    	M2_water  INTEGER, M2_earth  INTEGER, 
    	M3_fire   INTEGER, M3_air    INTEGER, 
    	M3_water  INTEGER, M3_earth  INTEGER, 
    	M4_fire   INTEGER, M4_air    INTEGER, 
    	M4_water  INTEGER, M4_earth  INTEGER, 
    	D1_fire   INTEGER, D1_air    INTEGER, 
    	D1_water  INTEGER, D1_earth  INTEGER, 
    	D2_fire   INTEGER, D2_air    INTEGER, 
    	D2_water  INTEGER, D2_earth  INTEGER, 
    	D3_fire   INTEGER, D3_air    INTEGER, 
    	D3_water  INTEGER, D3_earth  INTEGER, 
    	D4_fire   INTEGER, D4_air    INTEGER, 
    	D4_water  INTEGER, D4_earth  INTEGER, 
    	N1_fire   INTEGER, N1_air    INTEGER, 
    	N1_water  INTEGER, N1_earth  INTEGER, 
    	N2_fire   INTEGER, N2_air    INTEGER, 
    	N2_water  INTEGER, N2_earth  INTEGER, 
    	N3_fire   INTEGER, N3_air    INTEGER, 
    	N3_water  INTEGER, N3_earth  INTEGER, 
    	N4_fire   INTEGER, N4_air    INTEGER, 
    	N4_water  INTEGER, N4_earth  INTEGER, 
    	RW1_fire  INTEGER, RW1_air   INTEGER, 
    	RW1_water INTEGER, RW1_earth INTEGER, 
    	LW2_fire  INTEGER, LW2_air   INTEGER, 
    	LW2_water INTEGER, LW2_earth INTEGER, 
    	J3_fire   INTEGER, J3_air    INTEGER, 
    	J3_water  INTEGER, J3_earth  INTEGER);"
    puts "Charts table exists"

rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end

begin
	db = SQLite3::Database.open "geomantic.db"
    db.execute "CREATE TABLE IF NOT EXISTS 
    Figures (ID INTEGER PRIMARY KEY, Number INTEGER, 
    Name TEXT, Translation TEXT, Figure TEXT);"
    # puts "Figures table exists"

    begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "SELECT Name FROM Figures 
		WHERE ID = 1;"
		result_set = statement.execute

		row = result_set.next_hash

		# p row

	    if row == nil
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

		    puts "figures inserted"

		end

	rescue SQLite3::Exception => e     
		puts "Exception occurred"
		puts e    
	ensure
		statement.close if statement
		db.close if db    
	end

rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end

#something to take in info about a chart and 
#pass it to the DB - DONE

def chart_info
	puts "Name of chart: "
	c_name = gets.chomp
	puts "Date: "
	c_date = gets.chomp
	puts "Who is the chart for? "
	c_for = gets.chomp
	puts "Who is the chart being created by? "
	c_by = gets.chomp
	puts "What is the subject of the reading? "
	c_subject = gets.chomp

	puts
	puts "-------------------"
	puts

	begin
		db = SQLite3::Database.open "geomantic.db"
		db.execute "INSERT INTO Charts 
		(Chart_name, Date, For, By, Subject) 
		VALUES ('#{c_name}', '#{c_date}', 
		'#{c_for}', '#{c_by}', '#{c_subject}');"

		$id = db.last_insert_row_id

		# statement = db.prepare "SELECT * FROM Charts 
		# WHERE ID=?;"
  #   	statement.bind_param 1, $id
  #   	result_set = statement.execute
    
  #   	row = result_set.next
    
  #   	puts
  #   	p row

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		# statement.close if statement
    	db.close if db    
	end

end

#generates a line - DONE

def generate_line
	if (rand(9) + 1).even?
    	line_value = 2
  	else 
    	line_value = 1
  	end

#  	puts "line = #{line_value}"
end

#run generate_line four times to make a mother - DONE

def generate_mother

	@fire_line  = generate_line
	@air_line   = generate_line
	@water_line = generate_line
	@earth_line = generate_line

	# puts
	# puts "fire line = #{fire_line}"
	# puts "air line = #{air_line}"
	# puts "water line = #{water_line}"
	# puts "earth line = #{earth_line}"
	# puts

end

#method to derive other figures - DONE

def derive_figure (fire_1, air_1, water_1, earth_1, 
	fire_2, air_2, water_2, earth_2)

	if (fire_1 + fire_2).even?
		@fire_new = 2
	else
		@fire_new = 1
	end

	if (air_1 + air_2).even?
		@air_new = 2
	else 
		@air_new = 1
	end

	if (water_1 + water_2).even?
		@water_new = 2
	else 
		@water_new = 1
	end

	if (earth_1 + earth_2).even?
		@earth_new = 2
	else 
		@earth_new = 1
	end

	# puts
	# puts fire_new
	# puts air_new
	# puts water_new
	# puts earth_new
	# puts

end

#method to look up figures from table

def lookup_figure(fire, air, water, earth)

	figid = (fire.to_s + air.to_s + water.to_s + 
		earth.to_s).to_i

	# puts figid

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "SELECT * FROM Figures 
		WHERE Number=?;"
		statement.bind_param 1, figid
		result_set = statement.execute

		# p result_set

		row = result_set.next

		# puts
		# p row

		id       = row.at(0)
		fignum   = row.at(1)
		figname  = row.at(2)
		figtrans = row.at(3)
		figure   = row.at(4)

		puts
		puts figname
		print figure
		puts

	rescue SQLite3::Exception => e     
		puts "Exception occurred"
		puts e    
	ensure
		statement.close if statement
		db.close if db    
	end		
end

chart_info

#something to pass the mothers into the DB - DONE

#First Mother
begin
	generate_mother

	# puts
	# puts @fire_line
	# puts @air_line
	# puts @water_line
	# puts @earth_line
	# puts


	db = SQLite3::Database.open "geomantic.db"
	db.execute "UPDATE Charts 
	SET M1_fire  = '#{@fire_line}', 
		M1_air   = '#{@air_line}', 
		M1_water = '#{@water_line}', 
		M1_earth = '#{@earth_line}' 
	WHERE ID = #{$id};"

	# puts "updated first mother"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# puts
	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	db.close if db    
end

#Second Mother
begin
	generate_mother

	# puts
	# puts @fire_line
	# puts @air_line
	# puts @water_line
	# puts @earth_line
	# puts


	db = SQLite3::Database.open "geomantic.db"
	db.execute "UPDATE Charts 
	SET M2_fire  = '#{@fire_line}', 
		M2_air   = '#{@air_line}', 
		M2_water = '#{@water_line}', 
		M2_earth = '#{@earth_line}' 
	WHERE ID = #{$id};"

	# puts "updated second mother"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# puts
	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	db.close if db    
end

#Third Mother
begin
	generate_mother

	# puts
	# puts @fire_line
	# puts @air_line
	# puts @water_line
	# puts @earth_line
	# puts


	db = SQLite3::Database.open "geomantic.db"
	db.execute "UPDATE Charts 
	SET M3_fire  = '#{@fire_line}', 
		M3_air   = '#{@air_line}', 
		M3_water = '#{@water_line}', 
		M3_earth = '#{@earth_line}' 
	WHERE ID = #{$id};"

	# puts "updated third mother"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# puts
	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	db.close if db    
end

#Fourth Mother
begin
	generate_mother

	# puts
	# puts @fire_line
	# puts @air_line
	# puts @water_line
	# puts @earth_line
	# puts


	db = SQLite3::Database.open "geomantic.db"
	db.execute "UPDATE Charts 
	SET M4_fire  = '#{@fire_line}', 
		M4_air   = '#{@air_line}', 
		M4_water = '#{@water_line}', 
		M4_earth = '#{@earth_line}' 
	WHERE ID = #{$id};"

	# puts "updated fourth mother"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# puts
	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	db.close if db    
end

#something to assemble daughters - DONE

begin
	db = SQLite3::Database.open "geomantic.db"

	#first daughter
	statement1d = db.prepare "SELECT M1_fire, 
	M2_fire, M3_fire, M4_fire FROM Charts 
	WHERE ID=?;"
	statement1d.bind_param 1, $id
	result_set1d = statement1d.execute

	row1d = result_set1d.next

	# puts
	# p row1d

	d1_fire  = row1d.at(0)
	d1_air   = row1d.at(1)
	d1_water = row1d.at(2)
	d1_earth = row1d.at(3)

	# puts
	# puts "fire  #{d1_fire}"
	# puts "air   #{d1_air}"
	# puts "water #{d1_water}"
	# puts "earth #{d1_earth}"
	# puts

	db.execute "UPDATE Charts 
	SET D1_fire  = '#{d1_fire}', 
		D1_air   = '#{d1_air}', 
		D1_water = '#{d1_water}', 
		D1_earth = '#{d1_earth}' 
	WHERE ID = #{$id};"

	# puts "updated d1"

	#second daughter
	statement2d = db.prepare "SELECT M1_air, 
	M2_air, M3_air, M4_air FROM Charts 
	WHERE ID=?;"
	statement2d.bind_param 1, $id
	result_set2d = statement2d.execute

	row2d = result_set2d.next

	# puts
	# p row2d

	d2_fire  = row2d.at(0)
	d2_air   = row2d.at(1)
	d2_water = row2d.at(2)
	d2_earth = row2d.at(3)

	# puts
	# puts "fire  #{d2_fire}"
	# puts "air   #{d2_air}"
	# puts "water #{d2_water}"
	# puts "earth #{d2_earth}"
	# puts

	db.execute "UPDATE Charts 
	SET D2_fire  = '#{d2_fire}', 
		D2_air   = '#{d2_air}', 
		D2_water = '#{d2_water}', 
		D2_earth = '#{d2_earth}' 
	WHERE ID = #{$id};"

	# puts "updated d2"

	#third daughter
	statement3d = db.prepare "SELECT M1_water, 
	M2_water, M3_water, M4_water FROM Charts 
	WHERE ID=?;"
	statement3d.bind_param 1, $id
	result_set3d = statement3d.execute

	row3d = result_set3d.next

	# puts
	# p row3d

	d3_fire  = row3d.at(0)
	d3_air   = row3d.at(1)
	d3_water = row3d.at(2)
	d3_earth = row3d.at(3)

	# puts
	# puts "fire  #{d3_fire}"
	# puts "air   #{d3_air}"
	# puts "water #{d3_water}"
	# puts "earth #{d3_earth}"
	# puts

	db.execute "UPDATE Charts 
	SET D3_fire  = '#{d3_fire}', 
		D3_air   = '#{d3_air}', 
		D3_water = '#{d3_water}', 
		D3_earth = '#{d3_earth}' 
	WHERE ID = #{$id};"

	# puts "updated d3"

		#fourth daughter
	statement4d = db.prepare "SELECT M1_earth, 
	M2_earth, M3_earth, M4_earth FROM Charts 
	WHERE ID=?;"
	statement4d.bind_param 1, $id
	result_set4d = statement4d.execute

	row4d = result_set4d.next

	# puts
	# p row4d

	d4_fire  = row4d.at(0)
	d4_air   = row4d.at(1)
	d4_water = row4d.at(2)
	d4_earth = row4d.at(3)

	# puts
	# puts "fire  #{d4_fire}"
	# puts "air   #{d4_air}"
	# puts "water #{d4_water}"
	# puts "earth #{d4_earth}"
	# puts

	db.execute "UPDATE Charts 
	SET D4_fire  = '#{d4_fire}', 
		D4_air   = '#{d4_air}', 
		D4_water = '#{d4_water}', 
		D4_earth = '#{d4_earth}' 
	WHERE ID = #{$id};"

	# puts "updated d4"

	statement1d_out = db.prepare "SELECT * FROM Charts 
	WHERE ID=?;"
	statement1d_out.bind_param 1, $id
	result_set1d_out = statement1d_out.execute

	row1d_out = result_set1d_out.next

	# puts
	# p row1d

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	statement1d.close if statement1d
	statement2d.close if statement2d
	statement3d.close if statement3d
	statement4d.close if statement4d
	statement1d_out.close if statement1d_out
	db.close if db    
end

#update remaining figures in database

#First Niece
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT M1_fire,
	M1_air, M1_water, M1_earth, M2_fire, M2_air,
	M2_water, M2_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET N1_fire  = '#{@fire_new}', 
		N1_air   = '#{@air_new}', 
		N1_water = '#{@water_new}', 
		N1_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated first niece"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# puts
	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Second Niece
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT M3_fire,
	M3_air, M3_water, M3_earth, M4_fire, M4_air,
	M4_water, M4_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET N2_fire  = '#{@fire_new}', 
		N2_air   = '#{@air_new}', 
		N2_water = '#{@water_new}', 
		N2_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated second niece"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Third Niece
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT D1_fire,
	D1_air, D1_water, D1_earth, D2_fire, D2_air,
	D2_water, D2_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET N3_fire  = '#{@fire_new}', 
		N3_air   = '#{@air_new}', 
		N3_water = '#{@water_new}', 
		N3_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated third niece"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Fourth Niece
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT D3_fire,
	D3_air, D3_water, D3_earth, D4_fire, D4_air,
	D4_water, D4_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET N4_fire  = '#{@fire_new}', 
		N4_air   = '#{@air_new}', 
		N4_water = '#{@water_new}', 
		N4_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated fourth niece"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Right witness
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT N1_fire,
	N1_air, N1_water, N1_earth, N2_fire, N2_air,
	N2_water, N2_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET RW1_fire  = '#{@fire_new}', 
		RW1_air   = '#{@air_new}', 
		RW1_water = '#{@water_new}', 
		RW1_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated right witness"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Left witness
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT N3_fire,
	N3_air, N3_water, N3_earth, N4_fire, N4_air,
	N4_water, N4_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET LW2_fire  = '#{@fire_new}', 
		LW2_air   = '#{@air_new}', 
		LW2_water = '#{@water_new}', 
		LW2_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated left witness"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end

#Judge
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1 = db.prepare "SELECT RW1_fire,
	RW1_air, RW1_water, RW1_earth, LW2_fire, LW2_air,
	LW2_water, LW2_earth FROM Charts WHERE Id = ?;"
	statement1.bind_param 1, $id
	result_set1 = statement1.execute

	# p result_set1

	# row1 = result_set1.next

	# p row1

	fire_1  = row1.at(0)
	air_1   = row1.at(1)
	water_1 = row1.at(2)
	earth_1 = row1.at(3)
	fire_2  = row1.at(4)
	air_2   = row1.at(5)
	water_2 = row1.at(6)
	earth_2 = row1.at(7)

	derive_figure(fire_1, air_1, water_1, 
		earth_1, fire_2, air_2, water_2, earth_2)

	# puts
	# puts @fire_new
	# puts @air_new
	# puts @water_new
	# puts @earth_new
	# puts

	db.execute "UPDATE Charts 
	SET J3_fire  = '#{@fire_new}', 
		J3_air   = '#{@air_new}', 
		J3_water = '#{@water_new}', 
		J3_earth = '#{@earth_new}' 
	WHERE ID = #{$id};"

	# puts "updated judge"

	# statement = db.prepare "SELECT * FROM Charts 
	# WHERE ID=?;"
	# statement.bind_param 1, $id
	# result_set = statement.execute

	# row = result_set.next

	# p row

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1.close if statement1
	db.close if db    
end



#something to output the figures

#print first mother
begin
	db = SQLite3::Database.open "geomantic.db"

	statement1m = db.prepare "SELECT M1_fire,
	M1_air, M1_water, M1_earth FROM Charts WHERE Id = ?;"
	statement1m.bind_param 1, $id
	result_set1m = statement1m.execute

	# p result_set1

	row1m = result_set1m.next

	# p row1

	fire  = row1m.at(0)
	air   = row1m.at(1)
	water = row1m.at(2)
	earth = row1m.at(3)

	puts "First Mother:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1m.close if statement1m
	db.close if db    
end

#print second mother
begin
	db = SQLite3::Database.open "geomantic.db"

	statement2m = db.prepare "SELECT M2_fire,
	M2_air, M2_water, M2_earth FROM Charts WHERE Id = ?;"
	statement2m.bind_param 1, $id
	result_set2m = statement2m.execute

	# p result_set1

	row2m = result_set2m.next

	# p row1

	fire  = row2m.at(0)
	air   = row2m.at(1)
	water = row2m.at(2)
	earth = row2m.at(3)

	puts "Second Mother:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement2m.close if statement2m
	db.close if db    
end

#print third mother

begin
	db = SQLite3::Database.open "geomantic.db"

	statement3m = db.prepare "SELECT M3_fire,
	M3_air, M3_water, M3_earth FROM Charts WHERE Id = ?;"
	statement3m.bind_param 1, $id
	result_set3m = statement3m.execute

	# p result_set1

	row3m = result_set3m.next

	# p row1

	fire  = row3m.at(0)
	air   = row3m.at(1)
	water = row3m.at(2)
	earth = row3m.at(3)

	puts "Third Mother:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement3m.close if statement3m
	db.close if db    
end

#print fourth mother

begin
	db = SQLite3::Database.open "geomantic.db"

	statement4m = db.prepare "SELECT M4_fire,
	M4_air, M4_water, M4_earth FROM Charts WHERE Id = ?;"
	statement4m.bind_param 1, $id
	result_set4m = statement4m.execute

	# p result_set1

	row4m = result_set4m.next

	# p row1

	fire  = row4m.at(0)
	air   = row4m.at(1)
	water = row4m.at(2)
	earth = row4m.at(3)

	puts "Fourth Mother:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement4m.close if statement4m
	db.close if db    
end

#print First daughter

begin
	db = SQLite3::Database.open "geomantic.db"

	statement1d = db.prepare "SELECT D1_fire,
	D1_air, D1_water, D1_earth FROM Charts WHERE Id = ?;"
	statement1d.bind_param 1, $id
	result_set1d = statement1d.execute

	# p result_set1

	row1d = result_set1d.next

	# p row1

	fire  = row1d.at(0)
	air   = row1d.at(1)
	water = row1d.at(2)
	earth = row1d.at(3)

	puts "First Daughter:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement1d.close if statement1d
	db.close if db    
end

#print Second daughter

begin
	db = SQLite3::Database.open "geomantic.db"

	statement2d = db.prepare "SELECT D2_fire,
	D2_air, D2_water, D2_earth FROM Charts WHERE Id = ?;"
	statement2d.bind_param 1, $id
	result_set2d = statement2d.execute

	# p result_set1

	row2d = result_set2d.next

	# p row1

	fire  = row2d.at(0)
	air   = row2d.at(1)
	water = row2d.at(2)
	earth = row2d.at(3)

	puts "Second Daughter:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement2d.close if statement2d
	db.close if db    
end

#print Third daughter

begin
	db = SQLite3::Database.open "geomantic.db"

	statement3d = db.prepare "SELECT D3_fire,
	D3_air, D3_water, D3_earth FROM Charts WHERE Id = ?;"
	statement3d.bind_param 1, $id
	result_set3d = statement3d.execute

	# p result_set1

	row3d = result_set3d.next

	# p row1

	fire  = row3d.at(0)
	air   = row3d.at(1)
	water = row3d.at(2)
	earth = row3d.at(3)

	puts "Third Daughter:"

	lookup_figure(fire, air, water, earth)

	puts

rescue SQLite3::Exception => e     
	puts "Exception occurred"
	puts e    
ensure
	# statement.close if statement
	statement3d.close if statement3d
	db.close if db    
end
