require yaml
require pg

#something to take in info about a chart and pass it to the DB

#generates a line

def generate_line
	if (rand(9) + 1).even?
    	line_value = 2
  	else 
    	line_value = 1
  	end
  	return line_value
end

#something to run generate_line four times to make a mother

def generate_mother
	fire_line = fire_line.generate_line
	air_line = air_line.generate_line
	water_line = water_line.generate_line
	earth_line = earth_line.generate_line

	puts
	puts fire_line
	puts air_line
	puts water_line
	puts earth_line
	puts

end

4.generate_mother

#something to pass the mothers into the DB

#something to assemble daughters

#something to derive other figures

#something to identify figures from lines

#something to output the chart
