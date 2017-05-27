require yaml
require pg



#generates a line

def generate_line
	if (rand(9) + 1).even?
    value = 2
  else 
    value = 1
  end
  return value
end

