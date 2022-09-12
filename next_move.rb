require 'pry'
require_relative 'princess_saveable'
include PrincessSaveable


def nextMove(n,r,c,grid)
    grid = create_matrix(grid)
    p_location = locate_princess(grid)
    case
    when r > p_location[0]; move = "UP\n"
    when r < p_location[0]; move = "DOWN\n"
    when c > p_location[1]; move = "LEFT\n"
    when c < p_location[1]; move = "RIGHT\n"
    else move = "You've found the princess!"
    end
    print move
    unless move == "You've found the princess!"
        adjust_matrix(r, c, grid, p_location)
    end
end

def adjust_matrix(row, column, grid, p_loc)
    grid[row][column] = "-"
    m_loc = [row, column]
    m_loc = adjust_m_loc(m_loc, p_loc)
    grid[m_loc[0]][m_loc[1]] = "m"
    grid.map do |array|
        array.join
    end
end