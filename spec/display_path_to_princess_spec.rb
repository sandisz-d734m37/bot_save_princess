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