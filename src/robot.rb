puts "What is your command?"

command = nil
x_coordinate = nil
y_coordinate = nil
f = nil
loop do
    command = gets.upcase.chomp.split(" ")

    # system "clear"
    p command[0]
    if command == "QUIT" || command == "Q"
        break
    end


    case command[0]
    when "PLACE"
        instructions = command[1].split(",")
    
        x = instructions[0].to_i
        y = instructions[1].to_i
        raise TypeError, 'Invalid coordinates' unless x.is_a? Integer and y.is_a? Integer
        direction = instructions.last()
    
        if (x >= 0 && x < 5) == false || (y >= 0 && y < 5) == true
            x_coordinate = x
            y_coordinate = y
        else
            puts "invalid coordinates. Robot can only compute coordinates less than 5"
        end

        directions = ["NORTH", "EAST", "SOUTH", "WEST"]
        if directions.include?(direction) === true
            f = direction
            puts "invalid direction. Robot can only face north, south, east or west"
        end

        puts "placing the robot at #{x_coordinate}, #{y_coordinate} coordinates, #{direction} facing"
        puts "#{x_coordinate},#{y_coordinate},#{direction}"
        

    when "MOVE"
        puts "moving the robot"
    when "LEFT"
        
        puts "turning the robot left"
    when "RIGHT"
        puts "turning the robot right"
    when "REPORT"
        puts "the report of the robot place is"
    else
        puts "Robot does not compute. Please enter valid command & in the correct order -> 2,2,north"
    end
end