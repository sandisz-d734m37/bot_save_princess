require "pry"
require "./next_move.rb"
require "./display_path_to_princess.rb"
require "./runner_methods.rb"

describe "Save the Princess Runner Methods" do
    describe "create_grid" do
        it "intakes an odd number and outputs a matrix w/ the number's dimensions" do
            expect(create_grid(3)).to eq(["---", "---", "---"])
        end
        
        it "returns an error message if the number is even, 1, 0, or negative" do
            expect(create_grid(2)).to eq("Input must be an odd number higher than 1.")
            expect(create_grid(1)).to eq("Input must be an odd number higher than 1.")
            expect(create_grid(0)).to eq("Input must be an odd number higher than 1.")
            expect(create_grid(-3)).to eq("Input must be an odd number higher than 1.")
        end
    end

    describe "path_to_p_place_princess" do
        it "places the princess in a corner of the grid" do
            matrix = create_grid(3)
            options = [["p--","---","---"],["--p","---","---"],["---","---","--p"],["---","---","p--"]]
            expect(options).to include(path_to_p_place_princess(matrix, 3))
        end
    end
end