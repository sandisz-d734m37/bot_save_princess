require 'pry'

def nextMove(n,r,c,grid)
    grid = create_matrix(grid)
    p_location = locate_princess(grid)
    m_location = [r,c]
    case
    when r > p_location[0]; move = "UP\n"
    when r < p_location[0]; move = "DOWN\n"
    when c > p_location[1]; move = "LEFT\n"
    when c < p_location[1]; move = "RIGHT\n"
    else move = "You've found the princess!"
    end
    print move
    unless move == "You've found the princess!"
        adjust_matrix(r, c, grid, move)
    end
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    location = Array.new
    matrix.each_with_index do |array, row_num|
        array.each_with_index do |item, column_num|
            if item == "p"
                location[0] = row_num
                location[1] = column_num
                return location
            end
        end
    end
end

def adjust_matrix(row, column, grid, move)
    grid[row][column] = "-"
    case
    when move == "UP\n"; grid[row - 1][column] = "m"
    when move == "DOWN\n"; grid[row + 1][column] = "m"
    when move == "LEFT\n"; grid[row][column - 1] = "m"
    when move == "RIGHT\n"; grid[row][column + 1] = "m"
    end
    grid.map do |array|
        array.join
    end
end


# -------------------------------
# Tail from Hackerrank, if needed:

# n = gets.to_i

# r,c = gets.strip.split.map {|num| num.to_i}

# grid = Array.new(n)

# (0...n).each do |i|
#     grid[i] = gets
# end

# nextMove(n,r,c,grid)
# -------------------------------