require "pry"


def displayPathtoPrincess(n, grid)
    grid = create_matrix(grid)
    user_loc = [n/2, n/2]
    princess_loc = locate_princess(grid)
    create_path(user_loc, princess_loc)
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    location =[]
    matrix.each_with_index do |array, row_num|
        array.each_with_index do |item, column_num|
            if item == "p"
                location << row_num
                location << column_num
                return location
            end
        end
    end
end

def create_path(user_loc, princess_loc)
    until user_loc == princess_loc
        case
        when user_loc[0] > princess_loc[0]; move = "UP\n"
        when user_loc[0] < princess_loc[0]; move = "DOWN\n"
        when user_loc[1] > princess_loc[1]; move = "LEFT\n"
        when user_loc[1] < princess_loc[1]; move = "RIGHT\n"
        else move = "You've found the princess!"
        end
        print move
        user_loc = adjust_user_loc(user_loc, move)
    end
end

def adjust_user_loc(user_loc, move)
    case
    when move == "UP\n"; user_loc[0] -= 1
    when move == "DOWN\n"; user_loc[0] += 1
    when move == "LEFT\n"; user_loc[1] -= 1
    when move == "RIGHT\n"; user_loc[1] += 1
    end
    user_loc
end
        
# -------------------------------
# Tail from Hackerrank, if needed:

# m = gets.to_i

# grid = Array.new(m)

# (0...m).each do |i|
#     grid[i] = gets.strip
# end

# displayPathtoPrincess(m,grid)
# -------------------------------

