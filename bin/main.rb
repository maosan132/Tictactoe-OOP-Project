#!/usr/bin/env ruby
# game_logic

# links to classes inside /lib

require_relative '../lib/board'

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

def presentation
  $new_board.display
end

def clear_and_update
  Gem.win_platform? ? (system "cls") : (system "clear")
end
count = 0

def switch_turn
  $count.odd? ? turn = 'X' : turn = 'O'
end

while game_on
  count += 1
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
  
  taken = $new_board.taken?(cell_choice)
  if taken
    print 'that number is not available, choose other one: '
    cell_choice = gets.chomp.to_i
  end
  puts

  $new_board.update(cell_choice, turn)
  puts

  if count > 4 && $new_board.winner?(turn)
    presentation
    puts "and the winner is #{turn}"

    
  end


  if count == 8 || $new_board.tie?
    presentation
    puts 'game tie!'
    break
  end

end