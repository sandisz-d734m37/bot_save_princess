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
    user_loc.each_with_index do |num, index|
        until num == princess_loc[index]
            if index == 0
                if num < princess_loc[index]
                    num += 1
                    print "DOWN\n"
                elsif num > princess_loc[index]
                    num -= 1
                    print "UP\n"
                end
            else
                if num < princess_loc[index]
                    num += 1
                    print "RIGHT\n"
                elsif num > princess_loc[index]
                    num -= 1
                    print "LEFT\n"
                end 
            end
        end
    end
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

