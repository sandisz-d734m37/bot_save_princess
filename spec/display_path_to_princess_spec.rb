require "./display_path_to_princess.rb"
require "pry"

describe "Bot Saves Princess" do
    before do
        @matrix = ["---","-m-","p--"]
    end

    it "create_matrix translates the input to an array of arrays" do
        expect(create_matrix(@matrix)).to eq([["-","-","-",],["-","m","-",],["p","-","-",]])
    end
    describe "locate_princess" do
        before do
            @matrix_array = create_matrix(@matrix)
        end
        it "helper: find_row returns the index of the row 'p' is in" do
            expect(find_row(@matrix_array)).to eq(2)
        end

        it "helper: find_column returns the index of 'p' using the row found above" do
            row_index = find_row(@matrix_array)
            expect(find_column(@matrix_array, row_index)).to eq(0)
        end

        it "ultimately locates the princess" do
            expect(locate_princess(@matrix_array)).to eq([2, 0])
        end
    end

    it "create_path prints the moves made to get the user to the princess" do
        matrix_array = create_matrix(@matrix)
        princess_loc = locate_princess(matrix_array)
        m_loc = [1,1]

        expect(princess_loc).to eq([2,0])
        expect{ create_path(m_loc, princess_loc) }.to output("DOWN\nLEFT\n").to_stdout
    end

    it "adjust_m_loc adjusts the user's location" do
        expect(adjust_m_loc([1,1], [0,1])).to eq([0,1])
    end

    it "displayPathtoPrincess ultimately outputs the directions to the princess to the terminal" do
        expect{ displayPathtoPrincess(3, @matrix) }.to output("DOWN\nLEFT\n").to_stdout
    end
end