# Welcome to my Bot Saves Princess solve!

#### This repository host's a solve for Hackerrank's _[Bot Saves Princess 1](https://www.hackerrank.com/challenges/saveprincess)_ and _[Bot Saves Princess 2](https://www.hackerrank.com/challenges/saveprincess2)_ challenges, alongside a version of the challenge you can view in your terminal.
<br/>

#### Navigate to the _**Solutions section**_ for solves you can copy-and-paste into Hackerrank.
<br/>

#### Navigate to the _**Set Up and Play section**_ to learn how to clone and set up this repository on your own machine, in order to play/view the challenge in your own terminal.
<br/>

##### **Addtl. notes:** <br/>this repository runs on **Ruby 2.7.4**. Ensure you have this version of ruby (or higher) installed in order to run the challenge in your terminal. Follow **[this link to learn about installing ruby.](https://www.ruby-lang.org/en/documentation/installation/)** <br/> This application is tested using **RSpec**. If you'd like to run the test suite, clone the repo down to your own machine, navigate into the file, and run `$ rspec`. <br/> If you'd like to run the test suite but do not have RSpec installed, run `$ gem install rspec` then `$ rspec` in your terminal.
<hr/>

<details>
<summary>Solutions</summary>
<div class="section">
<hr/>


#### In this section, you'll find solves you can copy and past for _**[Bot Saves Princess 1 - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**_ and _**[Bot Saves Princess 2 - Next Move](https://www.hackerrank.com/challenges/saveprincess2)**_
<br/><br/>

### _**[Bot Saves Princess 1 - Display Path to Princess](https://www.hackerrank.com/challenges/saveprincess)**_
##### Be sure to copy this _entire codeblock_, replacing _everything_ in Hackerranks code editor!
```ruby
#!/bin/ruby

def displayPathtoPrincess(n, grid)
    grid = create_matrix(grid)
    m_loc = [n/2, n/2]
    p_loc = locate_princess(grid)
    create_path(m_loc, p_loc)
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    row = find_row(matrix)
    column = find_column(matrix, row)
    return [row, column]
end

def find_row(matrix)
    matrix.index do |array|
        array.include?("p")
    end
end

def find_column(matrix, row_index)
    matrix[row_index].index do |str|
        str == "p"
    end
end

def create_path(m_loc, p_loc)
    until m_loc == p_loc
        case
        when m_loc[0] > p_loc[0]; move = "UP\n"
        when m_loc[0] < p_loc[0]; move = "DOWN\n"
        when m_loc[1] > p_loc[1]; move = "LEFT\n"
        when m_loc[1] < p_loc[1]; move = "RIGHT\n"
        end
        print move
        m_loc = adjust_m_loc(m_loc, p_loc)
    end
end

def adjust_m_loc(m_loc, p_loc)
    case
    when m_loc[0] > p_loc[0]; m_loc[0] -= 1
    when m_loc[0] < p_loc[0]; m_loc[0] += 1
    when m_loc[1] > p_loc[1]; m_loc[1] -= 1
    when m_loc[1] < p_loc[1]; m_loc[1] += 1
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
    p_loc = locate_princess(grid)
    case
    when r > p_loc[0]; move = "UP\n"
    when r < p_loc[0]; move = "DOWN\n"
    when c > p_loc[1]; move = "LEFT\n"
    when c < p_loc[1]; move = "RIGHT\n"
    else move = "You've found the princess!"
    end
    print move
    unless move == "You've found the princess!"
        adjust_matrix(r, c, grid, p_loc)
    end
end

def create_matrix(matrix)
    matrix.map do |string|
        string.split("")
    end
end

def locate_princess(matrix)
    row = find_row(matrix)
    column = find_column(matrix, row)
    return [row, column]
end

def find_row(matrix)
    matrix.index do |array|
        array.include?("p")
    end
end

def find_column(matrix, row_index)
    matrix[row_index].index do |str|
        str == "p"
    end
end

def adjust_matrix(row, column, grid, p_loc)
    grid[row][column] = "-"
    m_loc = [row, column]
    m_loc = adjust_m_loc(m_loc, p_loc)
    grid[m_loc[0]][m_loc[1]] = "m"
    grid.map do |array|
        array.join
    end
end

def adjust_m_loc(m_loc, p_loc)
    case
    when m_loc[0] > p_loc[0]; m_loc[0] -= 1
    when m_loc[0] < p_loc[0]; m_loc[0] += 1
    when m_loc[1] > p_loc[1]; m_loc[1] -= 1
    when m_loc[1] < p_loc[1]; m_loc[1] += 1
    end
    m_loc
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
<hr/>

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
<hr/>
</div>
</details>

<details>
<summary>File structure</summary>

<hr/>

This repository is made up of 5 main files: <br/><br/>

### **1. display_path_to_princess.rb**
<br/>
This file hosts most of the code for the solution to our first solve, the displayPathtoPrincess method and it's un-repeated helper methods. (I'll get into what I mean by "un-repeated" in just a second!)
<br/><br/>

### **2. next_move.rb**
<br/>
Similar to the last file, this file hosts most of the code for the solution to our second problem, the nextMove method and it's un-repeated helper methods. 
<br/><br/>

### **3. princess_saveable.rb**
<br/>
This is where I'll explain what I mean by "un-repeated". This file hosts the PrincessSaveable module. I created this after noticing how many repeated methods there were between the two files above.
<br/><br/>

### **4. save_the_princess.rb**
<br/>
Our runner file. save_the_princess.rb hosts all of the prints, method calls, and system("clear") and sleep statements, allowing the user to play through the challenge in the terminal.
<br/><br/>

### **5. runner_methods.rb**
<br/>
The runner methods file hosts all of the necessary methods, specially created for the runner file.

</details>
<hr/>

## General description
The Bot Saves Princess challenge is a 2 part, low-level AI technical challenge. 

In part 1, a bot, m, is placed in the center of a matrix (an array of arrays) and our princess, p, is stuck in one of the corners of that very grid. The goal is to complete the displayPathtoPrincess method, allowing m to determine and print out the shortest route to the princess.

In part 2, m and p are both randomly placed in a grid and you are tasked with completing the nextMove method. nextMove allows m to determine the **single next move** to get to the princess. Meaning, if the princess is 2 positions to the left of m, nextMove should only output `LEFT\n`, as opposed to `LEFT\nLEFT\n`.

This applications in-terminal, viewable version simply goes through these 2 challenges, allowing the user to input any grid-size they like (so long as the size input is an odd number, 3 or higher). This was not part of the original challenge. I only made the runner file to help me really visualize and wrap my head around this problem in a fun, somewhat game-like way. Plus, it was a lot of fun to work on and it's pretty cool to watch the bot traverse the matrix to 'save' the princess.

<hr/>
