#!/usr/bin/ruby

require 'yaml'
require 'sqlite3'

#something to create database - DONE

begin
	db = SQLite3::Database.new "geomantic.db"
	# puts "database exists"

rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
    db.close if db    
end

#creation of table - DONE

begin
	db = SQLite3::Database.open "geomantic.db"
    # puts db.get_first_value 'SELECT SQLITE_VERSION()'
    db.execute "CREATE TABLE IF NOT EXISTS c_metadata (id INTEGER PRIMARY KEY, chart_name TEXT, date TEXT, for TEXT, by TEXT, subject TEXT);"
    # puts "Chart metadata table exists"

    db.execute "CREATE TABLE IF NOT EXISTS c_figures (id INTEGER PRIMARY KEY, chart_id INTEGER, fig_group TEXT, fig_position INTEGER, fire INTEGER, air INTEGER, water INTEGER, earth INTEGER);"
    # puts "Chart figures table exists"

    db.execute "CREATE TABLE IF NOT EXISTS figures (id INTEGER PRIMARY KEY, fire INTEGER, air INTEGER, water INTEGER, earth INTEGER, name TEXT, translation TEXT, figure TEXT);"
    # puts "figures table exists"

	statement = db.prepare "SELECT name FROM figures 
	WHERE ID = 1;"
	result_set = statement.execute

	row = result_set.next_hash

	# p row

	# if the figures are not already in the database, enter them
    if row == nil
		db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
		    VALUES (1, 1, 1, 1, 'Via', 'Way', ' * \n * \n * \n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 1, 1, 2, 'Cauda Draconis', 'Tail of the Dragon', ' * \n * \n * \n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 1, 2, 1, 'Puer', 'Boy', ' * \n * \n* *\n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 1, 2, 2, 'Fortuna Minor', 'Lesser Fortune', ' * \n * \n* *\n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 2, 1, 1, 'Puella', 'Girl', ' * \n* *\n * \n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 2, 1, 2, 'Amissio', 'Loss', ' * \n* *\n * \n* *');"
		db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 2, 2, 1, 'Carcer', 'Prison', ' * \n* *\n* *\n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (1, 2, 2, 2, 'Laetitia', 'Joy', ' * \n* *\n* *\n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 1, 1, 1, 'Caput Draconis', 'Head of the Dragon', '* *\n * \n * \n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 1, 1, 2, 'Conjunctio', 'Conjunction', '* *\n * \n * \n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 1, 2, 1, 'Acquisitio', 'Gain', '* *\n * \n* *\n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 1, 2, 2, 'Rubeus', 'Red', '* *\n * \n* *\n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 2, 1, 1, 'Fortuna Major', 'Greater Fortune', '* *\n* *\n * \n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 2, 1, 2, 'Albus', 'White', '* *\n* *\n * \n* *');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 2, 2, 1, 'Tristitia', 'Sorrow', '* *\n* *\n* *\n * ');"
	    db.execute "INSERT INTO figures (fire, air, water, earth, name, translation, figure)
	    VALUES (2, 2, 2, 2, 'Populus', 'People', '* *\n* *\n* *\n* *');"

	end #if

rescue SQLite3::Exception => e     
    puts "Exception occurred"
    puts e    
ensure
	statement.close if statement
    db.close if db    
end

#something to take in info about a chart and 
#pass it to the DB - DONE

def chart_info
	puts
	puts "~~~~"
	puts "WELCOME TO GEOMANTIC"
	puts "~~~~"
	puts "name of chart: "
	c_name = gets.chomp
	puts "Date: "
	c_date = gets.chomp
	puts "Who is the chart for? "
	c_for = gets.chomp
	puts "Who is the chart being created by? "
	c_by = gets.chomp
	puts "What is the subject of the reading? "
	c_subject = gets.chomp

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "INSERT INTO C_metadata 
		(Chart_name, Date, For, By, Subject) 
		VALUES ('#{c_name}', '#{c_date}', 
		'#{c_for}', '#{c_by}', '#{c_subject}');"
		statement.execute

		$chart_id = db.last_insert_row_id

		# p $chart_id

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement.close if statement
    	db.close if db    
	end

	puts
	puts "~~~~"
	puts

end

#generates a line - DONE
#creates one line of odd or even value
def generate_line
	if (rand(9) + 1).even?
    	line_value = 2
  	else 
    	line_value = 1
  	end

#  	puts "line = #{line_value}"
end

#run generate_line four times to make a mother, insert into db - DONE

def generate_mother (fig_position)

	fire  = generate_line
	air   = generate_line
	water = generate_line
	earth = generate_line

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "INSERT INTO C_figures 
		(chart_id, fig_group, fig_position, fire, air, water, earth) 
		VALUES (?, 'Mother', '#{fig_position}', '#{fire}', 
		'#{air}', '#{water}', '#{earth}');"
		statement.bind_param 1, $chart_id
		statement.execute

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement.close if statement
    	db.close if db    
	end

end

#method to derive daughters
#derives a daughter figure from the four mother figures
#the first daughter is made from the fire lines
#second from air
#third from water
#fourth from earth
def derive_daughter (d_fig_position)

	if d_fig_position == 1
		element = 'fire' 
	elsif d_fig_position == 2
		element = 'air' 
	elsif d_fig_position == 3
		element = 'water'
	elsif d_fig_position == 4
		element = 'earth' 
	else 
		puts "Error: too many elements"
	end
		
		

	begin
		#selects the appropriate line fromt the first mother
		#and assigns it as the fire line of the daughter
		db = SQLite3::Database.open "geomantic.db"
		statement1 = db.prepare "SELECT #{element} FROM c_figures 
		WHERE fig_group = 'Mother' AND fig_position = 1 AND 
		chart_id = ?;"
		statement1.bind_param 1, $chart_id
		result_set1 = statement1.execute

		# p result_set1

		row1 = result_set1.next_hash

		# p row1

		@fire  = row1[element]

		#assigns line from second mother as air line
		statement2 = db.prepare "SELECT #{element} FROM c_figures 
		WHERE fig_group = 'Mother' AND fig_position = 2 AND 
		chart_id = ?;"
		statement2.bind_param 1, $chart_id
		result_set2 = statement2.execute

		# p result_set2

		row2 = result_set2.next_hash

		@air  = row2[element]

		# p row2

		#assigns line from third mother as water line
		statement3 = db.prepare "SELECT #{element} FROM c_figures 
		WHERE fig_group = 'Mother' AND fig_position = 3 AND 
		chart_id = ?;"
		statement3.bind_param 1, $chart_id
		result_set3 = statement3.execute

		row3 = result_set3.next_hash

		# p row3

		@water = row3[element]
		
		#assigns line from fourth mother as earth line
		statement4 = db.prepare "SELECT #{element} FROM c_figures 
		WHERE fig_group = 'Mother' AND fig_position = 4 AND 
		chart_id = ?;"
		statement4.bind_param 1, $chart_id
		result_set4 = statement4.execute

		row4 = result_set4.next_hash

		# p row4

		@earth  = row4[element]


	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement1.close if statement1
		statement2.close if statement2
		statement3.close if statement3 
		statement4.close if statement4
    	db.close if db    
	end

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "INSERT INTO C_figures 
		(chart_id, fig_group, fig_position, fire, air, water, earth) 
		VALUES (?, 'Daughter', ?, '#{@fire}', '#{@air}', 
		'#{@water}', '#{@earth}');"
		statement.bind_param 1, $chart_id
		statement.bind_param 2, d_fig_position
		statement.execute

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement.close if statement
    	db.close if db    
	end
end


#method to derive other figures - DONE
#deriving other figures is done by adding the lines of the two figures 
#above and the resulting odd or even number determines the new line
def derive_figure (fig_group, fig_position)

	#case statement - DONE

	case fig_group
		when 'Niece'
			case fig_position
				when 1 then
					p1_group = 'Mother'
					p1_position = 1
					p2_group = 'Mother'
					p2_position = 2
				when 2 then
					p1_group = 'Mother'
					p1_position = 3
					p2_group = 'Mother'
					p2_position = 4
				when 3 then
					p1_group = 'Daughter'
					p1_position = 1
					p2_group = 'Daughter'
					p2_position = 2
				when 4 then
					p1_group = 'Daughter'
					p1_position = 1
					p2_group = 'Daughter'
					p2_position = 2
			end
		when 'Right Witness' then 
			p1_group = 'Niece'
			p1_position = 1
			p2_group = 'Niece'
			p2_position = 2
		when 'Left Witness' then
			p1_group = 'Niece'
			p1_position = 3
			p2_group = 'Niece'
			p2_position =4
		when 'Judge'
			p1_group = 'Right Witness'
			p1_position = 1
			p2_group = 'Left Witness'
			p2_position = 1
	end


	#fetch first additive figure from db
	begin
		db = SQLite3::Database.open "geomantic.db"
		statement1 = db.prepare "SELECT fire, air, water, earth FROM c_figures 
		WHERE fig_group = '#{p1_group}' AND fig_position = #{p1_position} AND 
		chart_id = ?;"
		statement1.bind_param 1, $chart_id
		result_set1 = statement1.execute

		# p result_set1

		row1 = result_set1.next_hash

		# p row1

		fire_1  = row1['fire']
		air_1   = row1['air']
		water_1 = row1['water']
		earth_1 = row1['earth']

		#fetch second additive figure from db
		statement2 = db.prepare "SELECT fire, air, water, earth FROM c_figures 
		WHERE fig_group = '#{p2_group}' AND fig_position = #{p2_position} AND 
		chart_id = ?;"
		statement2.bind_param 1, $chart_id
		result_set2 = statement2.execute

		# p result_set2

		row2 = result_set2.next_hash

		# p row2

		fire_2  = row2['fire']
		air_2   = row2['air']
		water_2 = row2['water']
		earth_2 = row2['earth']

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement1.close if statement1
		statement2.close if statement2
    	db.close if db    
	end	

	#add line and determine if even or odd
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

	#insert new figures into db
	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "INSERT INTO C_figures 
		(chart_id, fig_group, fig_position, fire, air, water, earth) 
		VALUES (?, '#{fig_group}', '#{fig_position}', #{fire_new}, 
		#{air_new}, #{water_new}, #{earth_new});"
		statement.bind_param 1, $chart_id
		statement.execute

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement.close if statement
    	db.close if db    
	end
end

#method to look up figures from table

def lookup_figure(fig_group, fig_position)

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "SELECT name, figure
		FROM figures
		INNER JOIN c_figures
		ON c_figures.fire = figures.fire
		AND c_figures.air = figures.air
		AND c_figures.water = figures.water
		AND c_figures.earth = figures.earth
		WHERE c_figures.fig_group = '#{fig_group}'
		AND c_figures.fig_position = #{fig_position}
		AND c_figures.chart_id = ?;"
		statement.bind_param 1, $chart_id
		result_set = statement.execute

		# p result_set

		row = result_set.next_hash

		# p row

		figname = row['name']
		figure  = row['figure'].to_s

		card_to_ord(fig_group, fig_position)

		puts
		puts "#{@fig_ord}#{fig_group}"
		puts figname
		puts figure
		puts

	rescue SQLite3::Exception => e     
		puts "Exception occurred"
		puts e    
	ensure
		statement.close if statement
		db.close if db    
	end		
end

#method to convert cardinal numbers to ordinals -- DONE
def card_to_ord(fig_group, fig_position)

	if (fig_group == 'Mother' || fig_group == 'Daughter' || fig_group == 'Niece')
		if fig_position == 1
			@fig_ord = 'First '
		elsif fig_position == 2
			@fig_ord = 'Second '
		elsif fig_position == 3
			@fig_ord = 'Third '
		elsif fig_position == 4
			@fig_ord = 'Fourth '
		else
			puts 'error: no such ordinal'
		end
	else
		@fig_ord = ''
	end
		
end

#method to ask if user wants to generate or input mothers -- DONE
def input_or_generate
	puts "Do you wish to A) input or B) generate the Mothers?"
	choice = gets.chomp.capitalize

	if choice == "A"
		(1..4).each do |e|
    		get_mother(e)
		end
	elsif choice == "B"
		(1..4).each do |e|
    		generate_mother(e)
		end
	else
		puts "Please input A or B."
		input_or_generate
	end
end

#method to accept input of mothers
#needs to be finished
def get_mother(fig_position)

	begin
		db = SQLite3::Database.open "geomantic.db"
		statement = db.prepare "SELECT name
		FROM figures;"
		result_set = statement.execute
		# names = result_set.to_a
		names = ["Via", "Cauda Draconis", "Puer", "Fortuna Minor", "Puella", "Amissio", "Carcer", "Laetitia", "Caput Draconis", "Conjunctio", "Acquisitio", "Rubeus", "Fortuna Major", "Albus", "Tristitia", "Populus"]
		# puts names[0].inspect
		card_to_ord('Mother', fig_position)

		puts "What is the #{@fig_ord}Mother? Please use proper capitalization."
		m_name = gets.chomp
		# puts m_name

		if names.include?(m_name) == false
			puts "Sorry, that is not a figure."
			get_mother(fig_position)
		else
			puts "That's a figure, alright!"
		end

		statement1 = db.prepare "SELECT fire, air, water, earth
		FROM figures WHERE name = '#{m_name}';"
		result_set1 = statement1.execute
		row1 = result_set1.next_hash
		p row1
		fire  = row1["fire"]
		puts fire
		air   = row1["air"]
		puts air
		water = row1["water"]
		puts water
		earth = row1["earth"]
		puts earth

		statement2 = db.prepare "INSERT INTO C_figures 
		(chart_id, fig_group, fig_position, fire, air, water, earth) 
		VALUES (?, 'Mother', '#{fig_position}', '#{fire}', 
		'#{air}', '#{water}', '#{earth}');"
		statement2.bind_param 1, $chart_id
		statement2.execute

	rescue SQLite3::Exception => e     
    	puts "Exception occurred"
    	puts e    
	ensure
		statement.close if statement
		statement1.close if statement1
		statement2.close if statement2
    	db.close if db    
	end

end

#execute things
chart_info

input_or_generate

(1..4).each do |e|
    derive_daughter(e)
end

(1..4).each do |e|
	derive_figure('Niece', e)
end

derive_figure('Right Witness', 1)

derive_figure('Left Witness', 1)

derive_figure('Judge', 1)

(1..4).each do |e|
    lookup_figure('Mother', e)
end

(1..4).each do |e|
    lookup_figure('Daughter', e)
end

(1..4).each do |e|
	lookup_figure('Niece', e)
end

lookup_figure('Right Witness', 1)

lookup_figure('Left Witness', 1)

lookup_figure('Judge', 1)
