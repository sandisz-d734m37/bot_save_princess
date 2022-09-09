require "./bot_save_princess.rb"
require "pry"

describe "matrix" do
    before do
        @matrix = "-,-,-\n-,m,-\np,-,-"
    end
    it "translates the input to an array of arrays" do
        
        expect(create_matrix(@matrix)).to eq([["-","-","-",],["-","m","-",],["p","-","-",]])
    end

end