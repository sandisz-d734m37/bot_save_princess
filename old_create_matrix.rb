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
        matrix[num/2][num/2] = "M"
        matrix
    else
        "Input must be an odd number"
    end
end

def display(matrix)
    matrix.each {|dash| puts dash.join("")}
end