require "pry"
require_relative "old_create_matrix.rb"

def displayPathtoPrincess(num, matrix)
    matrix = create_matrix(matrix)
    user_loc = [num/2, num/2]
    princess_loc = locate_princess(matrix)
    create_path(user_loc, princess_loc)
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

def create_path(user_loc, princess_loc)
    moves = []
    user_loc.each_with_index do |num, index|
        until num == princess_loc[index]
            if index == 0
                if num < princess_loc[index]
                    num += 1
                    moves << "Down"
                elsif num > princess_loc[index]
                    num -= 1
                    moves << "Up"
                end
            else
                if num < princess_loc[index]
                    num += 1
                    moves << "Right"
                elsif num > princess_loc[index]
                    num -= 1
                    moves << "Left"
                end 
            end
        end
    end
    moves
end
