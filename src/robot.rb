puts "What is your command?"

command = nil

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
    
        if (x >= 0 && x < 5) == false || (y >= 0 && y < 5) == false
            puts "invalid coordinates. Robot can only compute coordinates less than 5"
        end

        directions = ["NORTH", "EAST", "SOUTH", "WEST"]
        if directions.include?(direction) === false
            puts "invalid direction. Robot can only face north, south, east or west"
        end

        puts "placing the robot at #{x}, #{y} coordinates, #{direction} facing"
        

    when "MOVE"
        puts "moving the robot"
    when "LEFT"
        puts "turning the robot left"
    when "RIGHT"
        puts "turning the robot right"
    when "REPORT"
        puts "the report of the robot place is"
    end
end