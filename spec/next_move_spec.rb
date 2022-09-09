require "./next_move.rb"
require "pry"

describe "Bot Saves Princess" do
    before do
        @matrix = ["-----","-----","p--m-","-----","-----"]
    end

    it "determines then prints the next move to bring m to the p, then adjust the grid accordingly" do
        expect{ next_move(5,2,3,@matrix) }.to output("LEFT\n").to_stdout
        expect{ next_move(5,2,3,@matrix) }.to eq(["-----","-----","p-m--","-----","-----"])
    end
end