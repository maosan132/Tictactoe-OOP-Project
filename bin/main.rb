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
  
  def update(choice, current_player)
    if board[choice - 1] == '-'
      board[choice - 1] = current_player
    end

  end

  def winner?(current_player)
    if board[0] == current_player && board[1] == current_player && board[2] == current_player
      true
    elsif board[3] == current_player && board[4] == current_player && board[5] == current_player
      true
    elsif board[6] == current_player && board[7] == current_player && board[8] == current_player
      true
    elsif board[0] == current_player && board[3] == current_player && board[6] == current_player
      true
    elsif board[1] == current_player && board[4] == current_player && board[7] == current_player
      true
    elsif board[2] == current_player && board[5] == current_player && board[8] == current_player
      true
    elsif board[0] == current_player && board[4] == current_player && board[8] == current_player
      true
    elsif board[6] == current_player && board[4] == current_player && board[4] == current_player
      true
    else
      false
    end
  end


  def valid(choice)
    (1..9).include?(choice)
  end

  def taken?(choice)
    # board.include?(choice)
    board[choice - 1] != '-'
  end

  def tie?
    !board.include?('-')
  end
end 

class Player
  attr_reader :name

  def initialize
    @token_x = 'X'
    @token_o = 'O'
  end

  def name(name)
    @name = name
  end

  def valid_name(name)
    if name.is_a? Integer || name.size > 2
      print 'please type a valid name bigger than 2 characters'
    end
  end

  def player_turn
    
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


game_on = true
$new_board = Board.new
cover_image
# Separation of concerns
def presentation
  # new_board = Board.new
  
  $new_board.display
end

# def clear_and_update
#   system('cls')
# end
count = 0

def switch_turn
  $count.odd? ? turn = 'X' : turn = 'O'
end

while game_on
  puts game_on
  presentation
  count.even? ? turn = 'X' : turn = 'O'
  puts "turn is #{turn}"
  print "#{turn}, Choose a cell number from 1 to 9: "
  cell_choice = gets.chomp.to_i
  
  valid = $new_board.valid(cell_choice)
  if !valid 
    print "#{turn}, Choose a cell number from 1 to 9: "
    cell_choice = gets.chomp.to_i
  end
  puts 'taken:'
  
  taken = $new_board.taken?(cell_choice)
  if taken
    print 'that number is not available, choose other one: '
    cell_choice = gets.chomp.to_i
  end
  puts 

  # if count > 4 || $new_board.winner?(turn)
  #   puts "and the winner is #{turn}"
  #   break
  # end

  if count == 9 || $new_board.tie?
    puts 'tie!'
    break
  end

  $new_board.update(cell_choice, turn)
  puts
=begin
  if $new_board.winner?(turn)
    presentation
    puts "#{turn} wins!"
    game_on = false
  else
    puts 'Good move!'
  end

  if $new_board.tie?
    puts 'Tie Game!'
    game_on = false
  end
=end
  count += 1

end



=begin
intro
ask for player names
validate names
manage turns
ask for X or O to move!
validate option if is 1-9
is it taken? if doesnt, insert option into array
update board
won? if do, end game
if not, tie?
if so end game
end
=end

