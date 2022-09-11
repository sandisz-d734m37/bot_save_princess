<style>
summary{
    font-size: 14px;
}
.section{
    font-size: 12px;
}
</style>

# Welcome to my Bot Saves Princess solve!

#### This repository host's a solve for Hackerrank's _[Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess)_ and _[Bot Saves Princess 2](https://www.hackerrank.com/challenges/saveprincess2)_ challenges, alongside a version of the challenge you can view in your terminal.
<br/>

#### Navigate to the _**Solutions section**_ for solves you can copy-and-paste into Hackerrank.
<br/>

#### Navigate to the _**Set Up and Play section**_ to learn how to clone and set up this repository on your own machine, in order to play/view the challenge in your own terminal.
<br/>

##### **Addtl. notes:** <br/>this repository runs on **Ruby 2.7.4**. Ensure you have this version of ruby (or higher) installed in order to run the challenge in your terminal. Follow **[this link to learn about installing ruby.](https://www.ruby-lang.org/en/documentation/installation/)** <br/> This application is tested using **RSpec**. If you'd like to run the test suite, run `$ rspec` in your terminal. <br/> If you'd like to run the test suite but do not have RSpec installed, run `$ gem install rspec` then `$ rspec` in your terminal.
<hr/>

<details>
  <summary>Solutions</summary>
  <div class="section">

#### In this section, you'll find solves you can copy and past for _**[Bot Saves Princess 1 - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**_ and _**[Bot Saves Princess 2 - Next Move](https://www.hackerrank.com/challenges/saveprincess2)**_
<br/><br/>

### _**[Bot Saves Princess 1 - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**_
##### Be sure to copy this _entire codeblock_, replacing _everything_ in Hackerranks code editor!
```ruby
#!/bin/ruby

def displayPathtoPrincess(n, grid)
    grid = create_matrix(grid)
    m_loc = [n/2, n/2]
    princess_loc = locate_princess(grid)
    create_path(m_loc, princess_loc)
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    location =[]
    matrix.each_with_index do |array, row_num|
        array.each_with_index do |item, column_num|
            if item == "p"
                location << row_num
                location << column_num
                return location
            end
        end
    end
end

def create_path(m_loc, princess_loc)
    until m_loc == princess_loc
        case
        when m_loc[0] > princess_loc[0]; move = "UP\n"
        when m_loc[0] < princess_loc[0]; move = "DOWN\n"
        when m_loc[1] > princess_loc[1]; move = "LEFT\n"
        when m_loc[1] < princess_loc[1]; move = "RIGHT\n"
        else move = "You've found the princess!"
        end
        print move
        m_loc = adjust_m_loc(m_loc, move)
    end
end

def adjust_m_loc(m_loc, move)
    case
    when move == "UP\n"; m_loc[0] -= 1
    when move == "DOWN\n"; m_loc[0] += 1
    when move == "LEFT\n"; m_loc[1] -= 1
    when move == "RIGHT\n"; m_loc[1] += 1
    end
    m_loc
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
```

<br/><br/>

### _**[Bot Saves Princess 2 - Next Move](https://www.hackerrank.com/challenges/saveprincess2)**_
##### Be sure to copy this _entire codeblock_, replacing _everything_ in Hackerranks code editor!
```ruby
#!/bin/ruby

def nextMove(n,r,c,grid)
    grid = create_matrix(grid)
    p_location = locate_princess(grid)
    case
    when r > p_location[0]; move = "UP\n"
    when r < p_location[0]; move = "DOWN\n"
    when c > p_location[1]; move = "LEFT\n"
    when c < p_location[1]; move = "RIGHT\n"
    else move = "You've found the princess!"
    end
    print move
    unless move == "You've found the princess!"
        adjust_matrix(r, c, grid, move)
    end
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    location = Array.new
    matrix.each_with_index do |array, row_num|
        array.each_with_index do |item, column_num|
            if item == "p"
                location[0] = row_num
                location[1] = column_num
                return location
            end
        end
    end
end

def adjust_matrix(row, column, grid, move)
    grid[row][column] = "-"
    case
    when move == "UP\n"; grid[row - 1][column] = "m"
    when move == "DOWN\n"; grid[row + 1][column] = "m"
    when move == "LEFT\n"; grid[row][column - 1] = "m"
    when move == "RIGHT\n"; grid[row][column + 1] = "m"
    end
    grid.map do |array|
        array.join
    end
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
```

<hr/>
  </div>
</details>

<details>
    <summary>Set Up and Play</summary>
<div class="section">

#### In this section, you'll learn how to clone this repo down and view the challenge in your terminal.
<br/>

## Steps:
1. **Clone the repo**
    Simply run `$ git clone git@github.com:sandisz-d734m37/bot_save_princess.git` in your terminal
    <br/>

1. **Ensure you have ruby 2.7.4 or higher installed**
    If you already have a version of ruby installed, run `ruby -v` in your terminal to determine which version you have. 
    If your version is **below 2.7.4** (i.e. ruby 2.7.3), or you do not have a version of ruby installed, [follow this link](https://www.ruby-lang.org/en/documentation/installation/) to learn about and install ruby.
    ##### **Note: if you do have a version of ruby installed, but it's lower than 2.7.4, there's a good chance you can skip this step.**
    <br/>

1. **Run the runner file**
    To run the runner file in this repository, simply copy and paste the following into your terminal then follow the prompt!
```
$ ruby save_the_princess.rb
```
</div>
</details>
<hr/>

## General description
The Bot Saves Princess challenge is a 2 part, low-level AI technical challenge. 

In part 1, a bot, m, is placed in the center of a matrix (an array of arrays) and our princess, p, is stuck in one of the corners of that very grid. The goal is to complete the displayPathtoPrincess method, allowing m to determine and print out the shortest route to the princess.

In part 2, m and p are both randomly placed in a grid and you are tasked with completing the nextMove method. nextMove allows m to determine the **single next move** to get to the princess. Meaning, if the princess is 2 positions to the left of m, nextMove should only output `LEFT\n`, as opposed to `LEFT\nLEFT\n`.

This applications in-terminal, viewable version simply goes through these 2 challenges, allowing the user to input any grid-size they like (so long as the size input is an odd number, 3 or higher). This was not part of the original challenge. I only made the runner file to help me really visualize and wrap my head around this problem in a fun, somewhat game-like way. Plus, it was a lot of fun to work on and it's pretty cool to watch the bot traverse the matrix to 'save' the princess.