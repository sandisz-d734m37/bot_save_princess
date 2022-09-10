require "./display_path_to_princess.rb"
require "pry"

describe "Bot Saves Princess" do
    before do
        @matrix = ["---","-m-","p--"]
    end

    it "create_matrix translates the input to an array of arrays" do
        expect(create_matrix(@matrix)).to eq([["-","-","-",],["-","m","-",],["p","-","-",]])
    end

    it "locate_princess locates the princess" do
        matrix_array = create_matrix(@matrix)
        expect(locate_princess(matrix_array)).to eq([2, 0])
    end

    it "create_path prints the moves made to get the user to the princess" do
        matrix_array = create_matrix(@matrix)
        princess_loc = locate_princess(matrix_array)
        user_loc = [1,1]

        expect(princess_loc).to eq([2,0])
        expect{ create_path(user_loc, princess_loc) }.to output("DOWN\nLEFT\n").to_stdout
    end

    it "user_loc adjusts the user's location" do
        expect(adjust_user_loc([1,1], "UP\n")).to eq([0,1])
    end

    it "displayPathtoPrincess ultimately outputs the directions to the princess to the terminal" do
        expect{ displayPathtoPrincess(3, @matrix) }.to output("DOWN\nLEFT\n").to_stdout
    end
end