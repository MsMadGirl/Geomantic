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
    	puts "table created"

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
	c_name = gets
	puts "Date: "
	c_date = gets
	puts "Who is the chart for? "
	c_for = gets
	puts "Who is the chart being created by? "
	c_by = gets
	puts "What is the subject of the reading? "
	c_subject = gets

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
  #   	puts row.join "\r"

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		# statement.close if statement
    	db.close if db    
	end

end

chart_info

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
		fire_new = 2
	else
		fire_new = 1
	end

	if (air_1 + air_2).even?
		air_new = 2
	else 
		air_new = 1
	end

	if (water_1 + water_2).even?
		water_new = 2
	else 
		water_new = 1
	end

	if (earth_1 + earth_2).even?
		earth_new = 2
	else 
		earth_new = 1
	end

	puts
	puts fire_new
	puts air_new
	puts water_new
	puts earth_new
	puts

end

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
	# puts row.join "\r"

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
	# puts row.join "\r"

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
	# puts row.join "\r"

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
	# puts row.join "\r"

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

	puts
	puts row1d.join "\r"

	d1_fire  = row1d.at(0)
	d1_air   = row1d.at(1)
	d1_water = row1d.at(2)
	d1_earth = row1d.at(3)

	puts
	puts "fire  #{d1_fire}"
	puts "air   #{d1_air}"
	puts "water #{d1_water}"
	puts "earth #{d1_earth}"
	puts

	db.execute "UPDATE Charts 
	SET D1_fire  = '#{d1_fire}', 
		D1_air   = '#{d1_air}', 
		D1_water = '#{d1_water}', 
		D1_earth = '#{d1_earth}' 
	WHERE ID = #{$id};"

	puts "updated d1"

	#second daughter
	statement2d = db.prepare "SELECT M1_air, 
	M2_air, M3_air, M4_air FROM Charts 
	WHERE ID=?;"
	statement2d.bind_param 1, $id
	result_set2d = statement2d.execute

	row2d = result_set2d.next

	puts
	puts row2d.join "\r"

	d2_fire  = row2d.at(0)
	d2_air   = row2d.at(1)
	d2_water = row2d.at(2)
	d2_earth = row2d.at(3)

	puts
	puts "fire  #{d2_fire}"
	puts "air   #{d2_air}"
	puts "water #{d2_water}"
	puts "earth #{d2_earth}"
	puts

	db.execute "UPDATE Charts 
	SET D2_fire  = '#{d2_fire}', 
		D2_air   = '#{d2_air}', 
		D2_water = '#{d2_water}', 
		D2_earth = '#{d2_earth}' 
	WHERE ID = #{$id};"

	puts "updated d2"

	#third daughter
	statement3d = db.prepare "SELECT M1_water, 
	M2_water, M3_water, M4_water FROM Charts 
	WHERE ID=?;"
	statement3d.bind_param 1, $id
	result_set3d = statement3d.execute

	row3d = result_set3d.next

	puts
	puts row3d.join "\r"

	d3_fire  = row3d.at(0)
	d3_air   = row3d.at(1)
	d3_water = row3d.at(2)
	d3_earth = row3d.at(3)

	puts
	puts "fire  #{d3_fire}"
	puts "air   #{d3_air}"
	puts "water #{d3_water}"
	puts "earth #{d3_earth}"
	puts

	db.execute "UPDATE Charts 
	SET D3_fire  = '#{d3_fire}', 
		D3_air   = '#{d3_air}', 
		D3_water = '#{d3_water}', 
		D3_earth = '#{d3_earth}' 
	WHERE ID = #{$id};"

	puts "updated d3"

		#fourth daughter
	statement4d = db.prepare "SELECT M1_earth, 
	M2_earth, M3_earth, M4_earth FROM Charts 
	WHERE ID=?;"
	statement4d.bind_param 1, $id
	result_set4d = statement4d.execute

	row4d = result_set4d.next

	puts
	puts row4d.join "\r"

	d4_fire  = row4d.at(0)
	d4_air   = row4d.at(1)
	d4_water = row4d.at(2)
	d4_earth = row4d.at(3)

	puts
	puts "fire  #{d4_fire}"
	puts "air   #{d4_air}"
	puts "water #{d4_water}"
	puts "earth #{d4_earth}"
	puts

	db.execute "UPDATE Charts 
	SET D4_fire  = '#{d4_fire}', 
		D4_air   = '#{d4_air}', 
		D4_water = '#{d4_water}', 
		D4_earth = '#{d4_earth}' 
	WHERE ID = #{$id};"

	puts "updated d4"

	statement1d_out = db.prepare "SELECT * FROM Charts 
	WHERE ID=?;"
	statement1d_out.bind_param 1, $id
	result_set1d_out = statement1d_out.execute

	row1d_out = result_set1d_out.next

	puts
	puts row1d_out.join "\r"

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

#something to identify figures from lines

#something to output the chart

