#!/usr/bin/env ruby
# game_logic

# links to classes inside /lib

require_relative '../lib/board'


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

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end
count = 0

def switch_turn
  $count.odd? ? turn = 'X' : turn = 'O'
end

print 'Player one, please type your name'
player_one = Player.new
player_one = gets.chomp
if $new_board.valid_name(player_one)
  print 'Player one, please type a valid name'
end
puts "#{player_one}, welcome. The X is yours"
print 'Player two, please type your name'
player_two = gets.chomp
if $new_board.valid_name(player_one)
  print 'Player two, please type a valid name'
end
puts "#{player_two}, welcome. The O is yours"

while game_on
  count += 1
  # clear_screen
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