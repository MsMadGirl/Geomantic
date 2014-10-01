puts

require 'yaml'

def vertical_line
	[["|"],
	 ["|"],
	 ["|"],
	 ["|"]]
end

def blank_figure
	[["   "],
	 ["   "],
	 ["   "],
	 ["   "]]
end

def blank_space
	[[" "],
	 [" "],
	 [" "],
	 [" "]]
end



def geomancy_line
	if (rand(9) + 1).even?
		 output = "* *" and value = 2
	else output = " * " and value = 1
	end
	return [output, value]
end

	
def geomancy_figure

	fire_line  = geomancy_line
	air_line   = geomancy_line
	water_line = geomancy_line
	earth_line = geomancy_line

	figure = 	[[fire_line[0]],
				 [air_line[0]],
				 [water_line[0]],
				 [earth_line[0]]]

	figure_value =	[[fire_line[1]],
					 [air_line[1]],
					 [water_line[1]],
					 [earth_line[1]]]

	return [[figure], [figure_value]]

end		 

def mother1
	
	mother = geomancy_figure

	first_mother = [mother[0]]

	first_motherv = [mother[1]]

	return [[first_mother], [first_motherv]]

end

def mother2
	
	mother = geomancy_figure

	second_mother = [mother[0]]

	second_motherv = [mother[1]]

	return [[second_mother], [second_motherv]]

end

def mother3
	
	mother = geomancy_figure

	third_mother = [mother[0]]

	third_motherv = [mother[1]]

	return [[third_mother], [third_motherv]]

end

def mother4
	
	mother = geomancy_figure

	fourth_mother = [mother[0]]

	fourth_motherv = [mother[1]]

	return [[fourth_mother], [fourth_motherv]]

end

## All of this is screwed up
##def daughter1 

##	def fireline
##		if ((mother1[1[0]]) + (mother2[1[0]]) + (mother3[1[0]]) + (mother4[1[0]])).even?
##			 fire_line = "* *" and fire_value = 2
##		else fire_line = " * " and fire_value = 1
##		end

##		return [[fire_line], [fire_value]]
##	end

##	def airline
##		if ((first_motherv[1]) + (second_motherv[1]) + (third_motherv[1]) + (fourth_motherv[1])).even?
##			 air_line = "* *" and air_value = 2
##		else air_line = " * " and air_value = 1
##		end

##		return [[air_line], [air_value]]
##	end

##	def waterline
##		if ((first_motherv[2]) + (second_motherv[2]) + (third_motherv[2]) + (fourth_motherv[2])).even?
##			 water_line = "* *" and water_value = 2
##		else water_line = " * " and water_value = 1
##		end

##		return [[water_line], [water_value]]
##	end

##	def earthline
##		if ((first_motherv[3]) + (second_motherv[3]) + (third_motherv[3]) + (fourth_motherv[3])).even?
##			 earth_line = "* *" and earth_value = 2
##		else earth_line = " * " and earth_value = 1
##		end

##		return [[earth_line], [earth_value]]
##	end

##	first_daughter = 	[[fireline[0]],
##						 [airline[0]],
##						 [waterline[0]],
##						 [earthline[0]]]

##	first_daughterv =	[[fireline[1]],
##						 [airline[1]],
##						 [waterline[1]],
##						 [earthline[1]]]

##	return [[first_daughter], [first_daughterv]]
##end



puts mother1[0]
puts
puts mother2[1]
puts
puts mother3
puts
puts mother4
puts
puts daughter1[0]
puts daughter1[1]

puts




puts
