require 'pry'

class TicTacToe
  
  WIN_COMBONATIONS = [
    [0, 1, 2], #Top Row
    [3, 4, 5], #Middle Row
    [6, 7, 8], #Bottom Row
    [0, 3, 6], #First Column
    [1, 4, 7], #Second Column
    [2, 5, 8], #Third Column
    [0, 4, 8], #1-9 Diagonal
    [2, 4, 6], #3-7 Diagonal
    ]
    
    def initialize
      @board = Array.new(9, " ")
      @winner = nil 
    end
    
    def play
      
      while !(over?)
      turn 
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
    
  end
  
  def display_board
    puts " ----------- "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def postion_taken?(input)
    @board[input] != " " ? true : false
  end
  
  def valid_move?(input)
    !(position_taken?(input)) && input.between?(0, @board.length - 1)
  end
  
  def turn_count
    count = 0 
    
    @board.each do |index|
      if (index != " ")
        count += 1
      end
    end
    
    count
  end
  
  def current_player
    (turn_count.even?) ? "X" : "0"
  end
  
  def turn
    puts "Select a position between 1-9"
    input = gets
    index = input_to_index(input)
    
    #check for valid. 
    
    while !(valid_move?(index))
    puts "That's not valid. Try again!"
    input = gets 
    index = input_to_index(input)
  end
  
  move(index, current_player)
  display_board
  
end

def won?
  winning_array = nil
  
  WIN_COMBONATIONS.each do |element_array|
    inspected_array = [
      @board[element_array[0]],
      @board[element_array[1]],
      @board[element_array[2]],
      ]
      
      #X or 0 
      
      if inspected_array.all?{|el| el == "X"} || inspected_array.all?{|el| el == "0"}
        winning_array = element_array
        @winner = inspected_array[0]
      end
      
    end
    
    winning_array
  end
  
  def full?
    !(@board.include?(" "))
  end
  
  def draw?
    full? && !(won?)
  end
  #no one has one, board is full
  
  def over?
    draw? || won?
  end
  
  def winner
    (won?) ? @winner : nil
  end
  
end
        


    
    