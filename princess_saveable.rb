module PrincessSaveable
    def create_matrix(matrix)
        matrix.map do |string|
            string.split("")
        end
    end

    def locate_princess(matrix)
        row = find_row(matrix)
        column = find_column(matrix, row)
        return [row, column]
    end

    def find_row(matrix)
        matrix.index do |array|
            array.include?("p")
        end
    end

    def find_column(matrix, row_index)
        matrix[row_index].index do |str|
            str == "p"
        end
    end

    def adjust_m_loc(m_loc, princess_loc)
        case
        when m_loc[0] > princess_loc[0]; m_loc[0] -= 1
        when m_loc[0] < princess_loc[0]; m_loc[0] += 1
        when m_loc[1] > princess_loc[1]; m_loc[1] -= 1
        when m_loc[1] < princess_loc[1]; m_loc[1] += 1
        end
        m_loc
    end
end