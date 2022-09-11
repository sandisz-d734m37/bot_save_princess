require "./next_move.rb"
require "pry"

describe "Bot Saves Princess" do
    before do
        @matrix = ["-----","-----","p--m-","-----","-----"]
    end

    it "nextMove determines then prints the next move to bring m to the p, then adjust the grid accordingly" do
        expect{ nextMove(5,2,3,@matrix) }.to output("LEFT\n").to_stdout
        expect(nextMove(5,2,3,@matrix)).to eq(["-----","-----","p-m--","-----","-----"])
    end

    it "adjust_matrix uses the output of nextMove (i.e LEFT) to adjust the matrix" do
        grid = create_matrix(@matrix)
        expect(adjust_matrix(2,3,grid,[2,0])).to eq(["-----","-----","p-m--","-----","-----"])
    end
end