require "pry"

#---------------------------------------------
#----------Create Grid runner method----------
#---------------------------------------------

def create_grid(num)
    if num.odd? && num > 1
        matrix = []
        num.times do
            row = []
            num.times do
                row << "-"
            end
            matrix << row
        end
        matrix.map do |array|
            array.join
        end
    else
        "Input must be an odd number higher than 1."
    end
end

#---------------------------------------------
#-------Path to Princess runner methods-------
#---------------------------------------------

def path_to_p_place_princess(matrix, num)
    options = [[0,0], [0, num - 1], [num -1, 0], [num - 1, num - 1]]
    coords = options.sample
    matrix[coords[0]][coords[1]] = "p"
    matrix
end

#---------------------------------------------
#----------Next Move runner methods-----------
#---------------------------------------------

def next_move_place_bot(matrix, num)
    row = (0...num).to_a.sample
    col = (0...num).to_a.sample
    matrix[row][col] = "m"
    [row, col]
end

def next_move_place_princess(matrix, num)
    row = (0...num).to_a.sample
    col = (0...num).to_a.sample
    matrix[row][col] = "p"
    [row, col]
end

def next_move_adjust_m_loc(m_loc, princess_loc)
    case
    when m_loc[0] > princess_loc[0]; m_loc[0] -= 1
    when m_loc[0] < princess_loc[0]; m_loc[0] += 1
    when m_loc[1] > princess_loc[1]; m_loc[1] -= 1
    when m_loc[1] < princess_loc[1]; m_loc[1] += 1
    end
    m_loc
end

#---------------------------------------------
#---------------Display Matrix----------------
#---------------------------------------------

def display(matrix)
    matrix.each {|row| puts row}
end