require "./bot_save_princess.rb"
require "pry"

describe "matrix" do
    before do
        @matrix = "-,-,-\n-,m,-\np,-,-"
    end
    it "translates the input to an array of arrays" do
        
        expect(create_matrix(@matrix)).to eq([["-","-","-",],["-","m","-",],["p","-","-",]])
    end
    it "locates the princess" do
        array_matrix = create_matrix(@matrix)
        expect(locate_princess(array_matrix)).to eq([2, 0])
    end
end

describe "path" do
    before do
        str = "-,-,-\n-,m,-\np,-,-"
        @matrix = create_matrix(str)
        @princess_loc = locate_princess(@matrix)
        @user_loc = [1,1]
    end
    it "outputs an array of moves made to get the user to the princess" do
        expect(@princess_loc).to eq([2,0])
        expect(create_path(@user_loc, @princess_loc)).to eq(["Down","Left"])
    end
end