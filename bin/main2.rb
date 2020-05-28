#!/usr/bin/env ruby
# game_logic

# links to classes inside /lib

# require_relative '../lib/board.rb'

class Board
  attr_reader :board

  def initialize

    # @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    # @board = %W(\s \s \s \s \s \s \s \s \s)
    play_again
  end
  
  def play_again
    @board = Array.new(9, '-')
  end
  def display
    puts
    puts ' ' + board[0] + ' │ ' + board[1] + ' │ ' + board[2] + '    ░   1   2   3'
    puts '———┼———┼———' + (' ' * 3) + '░'
    puts ' ' + board[3] + ' │ ' + board[4] + ' │ ' + board[5] + '    ░   4   5   6'
    puts '———┼———┼———' + (' ' * 3) + '░'
    puts ' ' + board[6] + ' │ ' + board[7] + ' │ ' + board[8] + '    ░   7   8   9'
    puts
  end
  
  def update(cell_choice, current_player)
    if board[cell_choice-1] == '-'
      board[cell_choice-1] = current_player
    else
      
    end
  end

  def winner?(current_player)
    true if board[0] == board[1] && board[1] == board[2] && board[2] != '-'
  end
 
  def free_cell?
  end

  def valid?

  end

  def taken?

  end

  def tie?
    board.exclude?('-')
  end
end 

# Introduce the game to the players

def cover_image
  puts
  puts '           ▛┅┅┅┳┅┅┅┳┅┅▜'
  puts '           ┇ 1 ┇ 2 ┇ 3 ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ 4 ┇ 5 ┇ 6 ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ 7 ┇ 8 ┇ 9 ┇'
  puts '           ▙┅┅┅┻┅┅┅┻┅┅▟'
  puts
  puts 'Welcome to TIC-TAC-TOE by maosan132'
  puts
end 

$new_board = Board.new

# Separation of concerns
def presentation
  # new_board = Board.new
  cover_image
  $new_board.display
end

def clear_and_update
  system('cls')
end

while true
  presentation
  print 'Choose a cell number from 1 to 9: '
  cell_choice = gets.chomp.to_i
  $new_board.update(cell_choice, 'X')
  presentation
  $new_board.winner? ? p 'x wins' : 
  print 'Choose a cell number from 1 to 9: '
  cell_choice = gets.chomp.to_i

  $new_board.update(cell_choice, 'O')
    
end

