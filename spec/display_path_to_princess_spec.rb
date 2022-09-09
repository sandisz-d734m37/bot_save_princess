require "./bot_save_princess.rb"
require "pry"

describe "Bot Saves Princess" do
    before do
        @matrix = "-,-,-\n-,m,-\np,-,-"
    end

    it "translates the input to an array of arrays" do
        expect(create_matrix(@matrix)).to eq([["-","-","-",],["-","m","-",],["p","-","-",]])
    end

    it "locates the princess" do
        matrix_array = create_matrix(@matrix)
        expect(locate_princess(matrix_array)).to eq([2, 0])
    end

    it "outputs an array of moves made to get the user to the princess" do
        matrix_array = create_matrix(@matrix)
        princess_loc = locate_princess(matrix_array)
        user_loc = [1,1]

        expect(princess_loc).to eq([2,0])
        expect(create_path(user_loc, princess_loc)).to eq(["Down","Left"])
    end

    it "ultimately outputs the directions to the princess as a string" do
        expect(displayPathtoPrincess(3, @matrix)).to eq("Down\nLeft")
    end
end