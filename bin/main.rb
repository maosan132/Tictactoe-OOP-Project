#!/usr/bin/env ruby
# game_logic

# links to classes inside /lib

require_relative '../lib/board'
require_relative '../lib/player'

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
new_board = Board.new
count = 0

def update_screen
  Gem.win_platform? ? (system 'cls') : (system 'clear')
  cover_image
end

update_screen
print 'Player one, please type your name: '
player_name = gets.chomp
player_one = Player.new(player_name)
puts "Welcome, #{player_one.name}. The X is yours"

print 'Player two, please type your name: '
player_name = gets.chomp
player_two = Player.new(player_name)
puts "Welcome, #{player_two.name}. The O is yours"

while game_on
  update_screen
  new_board.display
  count += 1

  if count.odd?
    turn = 'X'
    player = player_one.name
  else
    turn = 'O'
    player = player_two.name
  end
  puts "turn is #{turn}"
  print "#{player}, Choose a cell number from 1 to 9: "
  cell_choice = gets.chomp.to_i

  valid = new_board.valid(cell_choice)
  unless valid
    print "#{turn}, Choose a cell number from 1 to 9: "
    cell_choice = gets.chomp.to_i
  end

  taken = new_board.taken?(cell_choice)
  if taken
    print 'that number is not available, choose other one: '
    cell_choice = gets.chomp.to_i
  end
  puts

  new_board.update(cell_choice, turn)
  puts

  if new_board.horizontal_winner?(turn) || new_board.vertical_winner?(turn) || new_board.diagonal_winner?(turn)
    update_screen
    puts "and the winner is #{turn}"
    break
  end

  next unless new_board.tie?

  update_screen
  puts 'game tie!'
  break

end
