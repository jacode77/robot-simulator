puts "What is your command?"

command = nil
@x_coordinate = nil
@y_coordinate = nil
@f = nil
@directions = ["NORTH", "EAST", "SOUTH", "WEST"]
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
    
        if (x >= 0 && x < 5) == true && (y >= 0 && y < 5) == true
            @x_coordinate = x
            @y_coordinate = y
        else
            puts "invalid coordinates. Robot can only compute coordinates less than 5"
        end

        if @directions.include?(direction) == true
            @f = direction
        else
            puts "invalid direction. Robot can only face north, south, east or west"
        end

        puts "placing the robot at #{@x_coordinate}, #{@y_coordinate} coordinates, #{@f} facing"
        puts "#{@x_coordinate},#{@y_coordinate},#{@f}"
        

    when "MOVE" 
        move(@f, @x_coordinate, @y_coordinate)
        p "x value is now: #{@x_coordinate}"
        p "y value is now: #{@y_coordinate}"
    when "LEFT"
        # when user enters left, increment directions index by 1 and return new value
        p @f
        idx = directions.index(@f) - 1
        @f = directions[idx]
        @f
        p "direction is at index no: #{idx}"
        p "direction is now: #{@f}"
        # I assume when user then chooses move, 
        # the new value of f will be new value and moves will run as setup
        puts "turning the robot left"
    when "RIGHT"
        turn_right(@f, @directions)

    when "REPORT"
        puts "Output: #{@x_coordinate},#{@y_coordinate}, #{@f}"
    else
        puts "Robot does not compute. Please enter valid command & in the correct order -> 2,2,north"
    end

    movement = nil
    
    def move(f, x_coordinate, y_coordinate)
        case f
    
        when "NORTH" 
            # until coordinate reaches 4 increment x_coordinate value by 1, for valid coordinates
            if (@y_coordinate >= 0) && (@y_coordinate <= 4)
                @y_coordinate +=1
            end

            # if y_coordinate < 0 or >= 5 tell user it's an invalid move and reset y_coordinate to previous value
            if  (@y_coordinate < 0) || (@y_coordinate >= 5)
                puts "Invalid move"
                @y_coordinate-=1                
            end
            
        when "EAST" 
             # until coordinate reaches 4 increment x_coordinate value by 1, for valid coordinates
             if (@x_coordinate >= 0) && (@x_coordinate <= 4)
                @x_coordinate +=1
            end

            # if x_coordinate >= 5 tell user it's an invalid move and reset x_coordinate to previous value
            if  (@x_coordinate < 0) || (@x_coordinate >= 5)
                puts "Invalid move"
                @x_coordinate-=1                
            end
            
        when "SOUTH" 
            # until coordinate reaches 4 increment x_coordinate value by 1, for valid coordinates
            if (@y_coordinate >= 0) && (@y_coordinate <= 4)
                @y_coordinate -=1
            end

            # if y_coordinate >= 5 tell user it's an invalid move and reset y_coordinate to previous value
            if  (@y_coordinate < 0 || @y_coordinate >= 5)
                puts "Invalid move"
                @y_coordinate+=1                
            end

        when "WEST" 
            # until coordinate reaches 4 increment x_coordinate value by 1, for valid coordinates
            if (@x_coordinate >= 0) && (@x_coordinate <= 4)
                @x_coordinate -=1
            end

            # if x_coordinate >= 5 tell user it's an invalid move and reset x_coordinate to previous value
            if  (@x_coordinate < 0) || (@x_coordinate >= 5)
                puts "Invalid move"
                @x_coordinate+=1                
            end

        else
            puts "Beep beep beep.... invalid move"
        end
    end

    def turn_right(f, directions)
            if directions.index(@f) < directions.length-1
            idx = directions.index(@f) + 1
            @f = directions[idx]
            end

            if directions.index(f) >= directions.length-1
                @f = directions[0]
            end
        p "direction is now: #{@f}"
        # puts "turning the robot right"
    end
   
end

