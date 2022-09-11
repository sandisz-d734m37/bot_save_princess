require "pry"
require_relative "next_move"
require_relative "display_path_to_princess"
require_relative "runner_methods"
#Runner File
system("clear")
puts "Input an odd number"

num = gets.chomp.to_i

grid = create_grid(num)

grid[num/2][num/2] = "m"

path_to_p_place_princess(grid, num)


display(grid)

puts "\nAll right, here's our grid." 
puts "m is our robot, p is our princess." 
puts "p is stuck in a corner of the board." 
puts "m's goal is to determine it's shortest path to p."
puts "Would you like to continue? (y/n)"
continue = gets.chomp.downcase

case
when continue == "y" || continue == "yes"
    sleep(1)
    puts ""
    puts "The shortest path to p is:"
    displayPathtoPrincess(num, grid)
when continue == "n" || continue == "no"
    return puts "\nWell alright, goodbye then!"
else
    return puts "You can't just enter #{continue} and expect something to happen." 
end

sleep(1)
puts "\nWow, this robot is a genius!"
puts "Such complex movements..."
sleep(1)
puts "\nAnywho, our next step is a little more complicated."
sleep(1)
puts "\nLast time, m was in the center and p was in a corner."
puts "This time around, m and p will both be placed randomly."
puts "Would you like to continue? (y/n)"

continue = gets.chomp.downcase

case
when continue == "y" || continue == "yes"
    puts "\nGreat! Enter another odd number, please!"
    num = gets.chomp.to_i
    grid = create_grid(num)
    p_loc = next_move_place_princess(grid, num)
    m_loc = next_move_place_bot(grid, num)
when continue == "n" || continue == "no"
    puts "\nBut......"
    sleep(1)
    return puts "...Alright alright, have a good one!"
else
    return puts "You can't just enter #{continue} and expect something to happen." 
end

display(grid)

puts "\nAlright, here's our new grid."
puts "Once again, m's mission is to get to p."
puts "Would you like to coninue? (y/n)"
continue = gets.chomp.downcase

case
when continue == "y" || continue == "yes"
    puts "\nLet's get going!"
    until p_loc == m_loc
        grid = nextMove(num, m_loc[0], m_loc[1], grid)
        m_loc = next_move_adjust_m_loc(m_loc, p_loc)
        display(grid)
        sleep(1)
    end
when continue == "n" || continue == "no"
    puts "\nBut we're so close......"
    sleep(1)
    return puts "...Alright alright, have a good one!"
else
    return puts "You can't just enter #{continue} and expect something to happen." 
end

puts "\nWoohoo! Against all odds, m made the journey to p."
puts "Go m!"
