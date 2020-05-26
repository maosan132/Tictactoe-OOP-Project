#!/usr/bin/env ruby

# game_logic

# links to classes inside /lib

require_relative '../lib/board.rb'

# Introduce the game to the players

def presentation
  puts
  puts '           ▛┅┅┅┳┅┅┅┳┅┅▜'
  puts '           ┇ 7 ┇ 8 ┇ 9 ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ 4 ┇ 5 ┇ 6 ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ 1 ┇ 2 ┇ 3 ┇'
  puts '           ▙┅┅┅┻┅┅┅┻┅┅▟'
  puts
  puts 'Welcome to TIC-TAC-TOE by maosan132'
end

# Separation of concerns
def play_game
  new_board = Board.new
  presentation
  board.display
end

