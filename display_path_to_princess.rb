require "pry"
require_relative 'princess_saveable'
include PrincessSaveable

def displayPathtoPrincess(n, grid)
    grid = create_matrix(grid)
    m_loc = [n/2, n/2]
    princess_loc = locate_princess(grid)
    create_path(m_loc, princess_loc)
end

def create_path(m_loc, princess_loc)
    until m_loc == princess_loc
        case
        when m_loc[0] > princess_loc[0]; move = "UP\n"
        when m_loc[0] < princess_loc[0]; move = "DOWN\n"
        when m_loc[1] > princess_loc[1]; move = "LEFT\n"
        when m_loc[1] < princess_loc[1]; move = "RIGHT\n"
        end
        print move
        m_loc = adjust_m_loc(m_loc, princess_loc)
    end
end