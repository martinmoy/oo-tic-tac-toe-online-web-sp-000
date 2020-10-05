class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]
def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
 index = input.to_i - 1
end


def move(index, value = "X")
  @board[index] = value
end


def position_taken?(index)
  (@board[index] == "X" || @board[index] == "O")
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else
    return false
  end
end

def turn_count
  turn_count = 0
  @board.each do |value|
    if value == "X" || value == "O"
      turn_count += 1
    end
  end
  return turn_count
end

def current_player
  turn_count.even? ? "X": "O"
end

def won?
  WIN_COMBINATIONS.detect do |combinations|
    position_1 = combinations[0]
    position_2 = combinations[1]
    position_3 = combinations[2]
    if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3]  == "X"
      return combinations
    elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
      return combinations
    end
  end
end



def full?
  @board.all? do |positions|
    positions == "X" || positions == "O"
  end
end

def draw?
 !won? && full?
end

def over?
  won? || draw?
end

def winner
  if win_combination = won?
    @board[win_combination.first]
  else
    return nil
  end
end

def turn
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else
    puts "Please enter another number:"
    return turn
  end
  display_board
end

def play
     until over?
        turn
     end
     if draw?
        puts "Cat's Game!"
     elsif
        won?
        winner == "X" || winner == "O"
        puts "Congratulations #{winner}!"
     end
  end


end
