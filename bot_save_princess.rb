require "pry"
require_relative "old_create_matrix.rb"

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

def locate_princess(matrix)
    location =[]
    matrix.each_with_index do |array, row_num|
        array.each_with_index do |item, column_num|
            if item == "p"
                location << row_num
                location << column_num
            end
        end
    end
    location
end