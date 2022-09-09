require "./bot_save_princess.rb"
require "pry"

describe "matrix" do
    it "creates a matrix if odd num is used" do
        expect(create_matrix(3)).to eq([["-","-","-",],["-","M","-",],["-","-","-",]])
        expect(create_matrix(5)).to eq([["-","-","-","-","-",],["-","-","-","-","-",],["-","-","M","-","-",],["-","-","-","-","-",],["-","-","-","-","-",],])
    end
    it "returns error if even number is used" do
        expect(create_matrix(4)).to eq("Input must be an odd number")
    end
end