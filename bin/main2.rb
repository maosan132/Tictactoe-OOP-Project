#!/usr/bin/env ruby
# game_logic

# links to classes inside /lib

require_relative '../lib/board.rb'

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

new_board = Board.new
# Separation of concerns
def presentation
  # new_board = Board.new
  cover_image
  new_board.display
end

while true
  presentation
  print 'Choose a cell number from 1 to 9: '
  cell_choice = gets.chomp

  #update board after choices

  board.update(cell_choice, 'X')
    
end

