#!/usr/bin/ruby

require 'yaml'
require 'sqlite3'

#something to create database

begin
	db = SQLite3::Database.new "geomantic.db"
rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end

#exception handling for db

begin
	db = SQLite3::Database.open "geomantic.db"
    puts db.get_first_value 'SELECT SQLITE_VERSION()'
    db.execute "CREATE TABLE IF NOT EXISTS 
    	Charts (Id INTEGER PRIMARY KEY, 
    	Chart_name TEXT, Date TEXT, For TEXT, 
    	By TEXT, Subject TEXT, 
    	M1_fire INTEGER,   M1_air INTEGER, 
    	M1_water INTEGER,  M1_earth INTEGER, 
    	M2_fire INTEGER,   M2_air INTEGER, 
    	M2_water INTEGER,  M2_earth INTEGER, 
    	M3_fire INTEGER,   M3_air INTEGER, 
    	M3_water INTEGER,  M3_earth INTEGER, 
    	M4_fire INTEGER,   M4_air INTEGER, 
    	M4_water INTEGER,  M4_earth INTEGER, 
    	D1_fire INTEGER,   D1_air INTEGER, 
    	D1_water INTEGER,  D1_earth INTEGER, 
    	D2_fire INTEGER,   D2_air INTEGER, 
    	D2_water INTEGER,  D2_earth INTEGER, 
    	D3_fire INTEGER,   D3_air INTEGER, 
    	D3_water INTEGER,  D3_earth INTEGER, 
    	D4_fire INTEGER,   D4_air INTEGER, 
    	D4_water INTEGER,  D4_earth INTEGER, 
    	N1_fire INTEGER,   N1_air INTEGER, 
    	N1_water INTEGER,  N1_earth INTEGER, 
    	N2_fire INTEGER,   N2_air INTEGER, 
    	N2_water INTEGER,  N2_earth INTEGER, 
    	N3_fire INTEGER,   N3_air INTEGER, 
    	N3_water INTEGER,  N3_earth INTEGER, 
    	N4_fire INTEGER,   N4_air INTEGER, 
    	N4_water INTEGER,  N4_earth INTEGER, 
    	RW1_fire INTEGER,  RW1_air INTEGER, 
    	RW1_water INTEGER, RW1_earth INTEGER, 
    	LW2_fire INTEGER,  LW2_air INTEGER, 
    	LW2_water INTEGER, LW2_earth INTEGER, 
    	J3_fire INTEGER,   J3_air INTEGER, 
    	J3_water INTEGER,  J3_earth INTEGER);"
    	puts "table created"

    	last_id = db.last_insert_row_id

  #   	if last_id != null
  #   		db.execute "INSERT INTO Charts 
		# 	(Chart_name) 
		# 	VALUES ("first");"
		# end


rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end



#something to take in info about a chart and 
#pass it to the DB

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

		@id = db.last_insert_row_id

		stm = db.prepare "SELECT * FROM Charts WHERE Id=?"
    	stm.bind_param 1, @id
    	rs = stm.execute
    
    	row = rs.next
    
    	puts
    	puts row.join "\r"

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
    	db.close if db    
	end

end

chart_info

#generates a line

def generate_line
	if (rand(9) + 1).even?
    	line_value = 2
  	else 
    	line_value = 1
  	end

  	puts line_value
end

#run generate_line four times to make a mother

def generate_mother
	fire_line  = fire_line.generate_line
	air_line   = air_line.generate_line
	water_line = water_line.generate_line
	earth_line = earth_line.generate_line

	puts
	puts fire_line
	puts air_line
	puts water_line
	puts earth_line
	puts

end

#generate_mother

#something to pass the mothers into the DB

#something to assemble daughters

#something to derive other figures

#something to identify figures from lines

#something to output the chart
