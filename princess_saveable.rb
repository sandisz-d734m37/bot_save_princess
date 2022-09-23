module PrincessSaveable
    def create_matrix(matrix)
        matrix.map do |string|
            string.split("")
        end
    end

    def locate_princess(matrix)
        # location = Array.new
        # matrix.each_with_index do |array, row_num|
        #     t = array.find_index do |item|
        #         item == "p"
        #     end
        # end

        row = find_row(matrix)
        column = matrix[row].index do |str|
            str == "p"
        end
        return [row, column]
    end

    def find_row(matrix)
        matrix.index do |array|
            array.include?("p")
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