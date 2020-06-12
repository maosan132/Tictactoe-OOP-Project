#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'

def draw(grid)
  puts grid
end

def shows_title
  puts '-' * 35
  puts '      TIC-TAC-TOE by maosan132'
  puts '-' * 35
end

def cover_image
  puts
  puts '           ▛┅┅┅┳┅┅┅┳┅┅▜'
  puts '           ┇ ﾒ ┇ ░ ┇ ░ ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ ░ ┇ ﾒ ┇ ░ ┇'
  puts '           ┣┅┅┅╋┅┅┅╋┅┅┅┫'
  puts '           ┇ ░ ┇ ░ ┇ ﾒ ┇'
  puts '           ▙┅┅┅┻┅┅┅┻┅┅▟'
  puts
  puts 'Welcome to TIC-TAC-TOE by maosan132'
  puts
end

def update_screen
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

game_on = true
new_board = Board.new
count = 0
cover_image
sleep 2
update_screen
shows_title
print 'Player one, please type your name: '
player_name = gets.chomp.capitalize
player_one = Player.new(player_name)
puts "Welcome, #{player_one.name}. The X is yours"
puts
print 'Player two, please type your name: '
player_name = gets.chomp.capitalize
player_two = Player.new(player_name)
puts "Welcome, #{player_two.name}. The O is yours"
puts
print "let's start TICTACTOE!"
sleep 1

while game_on
  update_screen
  shows_title
  new_board.display
  count += 1

  if count.odd?
    turn = 'X'
    player = player_one.name
  else
    turn = 'O'
    player = player_two.name
  end
  puts "    Playing #{turn}"
  puts
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

  if new_board.win?(turn)
    new_board.display
    puts
    puts '-' * 35
    puts turn == 'X' ? "   The winner is #{player_one.name}" : "The winner is #{player_two.name}"
    puts '-' * 35
    puts
    sleep 1
    break
  end

  next unless new_board.tie?

  new_board.display
  puts
  puts '-' * 35
  puts 'game tie!'
  puts '-' * 35
  puts
  sleep 1
  break

end
