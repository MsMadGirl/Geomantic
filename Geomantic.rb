#!/usr/bin/ruby

require 'yaml'
require 'sqlite3'

#something to create database

SQLite3::Database.new "geomantic"

#exception handling for db

begin
	db = SQLite3::Database.open "geomantic"
    puts db.get_first_value 'SELECT SQLITE_VERSION()'
    db.execute "CREATE TABLE IF NOT EXISTS 
    	Chart(Id INTEGER PRIMARY KEY, 
    	Chart_name TEXT, Date TEXT, For TEXT, 
    	BY TEXT, Subject TEXT, M1_fire INTEGER, 
    	M1_air INTEGER, M1_water INTEGER, 
    	M1_earth INTEGER, M2_fire INTEGER,
    	M2_air INTEGER, M2_water INTEGER,
    	M2_earth INTEGER, M3_fire INTEGER,
    	M3_air INTEGER, M3_water INTEGER,
    	M3_earth INTEGER, M4_fire INTEGER,
    	M4_air INTEGER, M4_water INTEGER,
    	M4_earth INTEGER)"
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
	chart_name = gets
	puts "Date: "
	date = gets
	puts = "Who is the chart for? "
	chart_for = gets
	puts = "Who is the chart being created by? "
	chart_by = gets
	puts = "What is the question about? "
	subject = gets

	begin
		db = SQLite3::Database.open "geomantic"
		db.execute ""


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

generate_mother

#something to pass the mothers into the DB

#something to assemble daughters

#something to derive other figures

#something to identify figures from lines

#something to output the chart
