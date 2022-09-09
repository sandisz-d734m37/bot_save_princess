require "pry"

def displayPathtoPrincess(num, matrix)
    matrix = create_matrix(matrix)
    @user_loc = [num/2, num/2]
    @princess_loc = locate_princess(matrix)
end

def create_matrix(matrix)
    matrix = matrix.split("\n")
    matrix.map do |string|
        string.split(",")
    end
end
binding.pry