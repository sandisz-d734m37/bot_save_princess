require "pry"

def old_create_matrix(num)
    if num.odd?
        matrix = []
        num.times do
            row = []
            num.times do
                row << "-"
            end
            matrix << row
        end
        matrix[num/2][num/2] = "m"
        place_princess(matrix, num)
    else
        "Input must be an odd number"
    end
end

def place_princess(matrix, num)
    options = [[0,0], [0, num - 1], [num -1, 0], [num - 1, num - 1]]
    @coords = options.sample
    matrix[@coords[0]][@coords[1]] = "p"
    matrix
end

def old_display(matrix)
    matrix.each {|dash| puts dash.join("")}
end