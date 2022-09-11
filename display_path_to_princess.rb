require "pry"


def displayPathtoPrincess(n, grid)
    grid = create_matrix(grid)
    m_loc = [n/2, n/2]
    princess_loc = locate_princess(grid)
    create_path(m_loc, princess_loc)
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

def create_path(m_loc, princess_loc)
    until m_loc == princess_loc
        case
        when m_loc[0] > princess_loc[0]; move = "UP\n"
        when m_loc[0] < princess_loc[0]; move = "DOWN\n"
        when m_loc[1] > princess_loc[1]; move = "LEFT\n"
        when m_loc[1] < princess_loc[1]; move = "RIGHT\n"
        else move = "You've found the princess!"
        end
        print move
        m_loc = adjust_m_loc(m_loc, move)
    end
end

def adjust_m_loc(m_loc, move)
    case
    when move == "UP\n"; m_loc[0] -= 1
    when move == "DOWN\n"; m_loc[0] += 1
    when move == "LEFT\n"; m_loc[1] -= 1
    when move == "RIGHT\n"; m_loc[1] += 1
    end
    m_loc
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

