#!/usr/bin/env ruby

# user_interface

# 1- Present the game to player(s)
# 2- Draw lines of board
# 3- Ask for a move and check if it is correct
# 4- Update the board
# 5- repeat 3 to 5 until a player has won or both has tied

# things to be heads up:
# -when the board is full
# -when there's a three line (winner)
# -when there's a tie

# Two classes are clear : board and player, maybe the game logic another one

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
puts
puts '--------- RULES OF GAME: ---------'
puts
puts '1 - The objective of the game is make a line of 3 tokens vertically, horizontally or diagonally '
puts '2 - First player would be assigned the ╳ token and second player the █ token'
puts '3 - Each turn every other player have a move, it must press a keypad number'
puts '4 - When all the positions are filled, either there will be a winner or a tie'
puts 'What\'s your name?'
# assignment of tokens should be in a player class, I guess
first_player = gets.chomp
puts "#{first_player}, you\'ve got the ╳"
puts
puts 'what\'s your opponent\'s name?'
second_player = gets.chomp
puts "#{second_player}, you\'ve got the █"
puts
puts 'Here, you have an empty board:'
# board = [[' ', ' ', ' '], [' ', ' ', ' '],[' ', ' ', ' '] ]
board = Array.new(3, Array.new(3, ' '))
# board2 = Array.new(3) { Array.new(3){' '} }
# puts board
# next should belong to a class, to follow DRY principle:1
puts
puts '         ' + board[0].join(' | ')
puts '        ———┼———┼———'
puts '         ' + board[1].join(' | ')
puts '        ———┼———┼———'
puts '         ' + board[2].join(' | ')
puts
# ends board class
counter = 0
move_request = 'Select a numpad key to make your move'
0.upto(9) do
  puts move_request
  move = gets.chomp
  if counter.even?
    puts "#{first_player}, you selected " + move
  else
    puts "#{second_player}, you selected " + move
  end
  puts
  counter += 1
  if counter < 9
    puts 'Next player, make a move!'
  else
    puts '------------> Last move!'
  end
end
