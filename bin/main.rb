#!/usr/bin/env ruby

# user_interface
=begin
1- Present the game to player(s)
2- Draw lines of board
3- Ask for a move and check if it is correct
4- Update the board
5- repeat 3 to 5 until a player has won or both has tied

things to be heads up:
-when the board is full
-when there's a three line (winner)
-when there's a tie

Two classes are clear : board and player, maybe the game logic another one

=end

puts
puts "           ▛┅┅┅┳┅┅┅┳┅┅▜"
puts "           ┇ 7 ┇ 8 ┇ 9 ┇"
puts "           ┣┅┅┅╋┅┅┅╋┅┅┅┫"
puts "           ┇ 4 ┇ 5 ┇ 6 ┇"
puts "           ┣┅┅┅╋┅┅┅╋┅┅┅┫"
puts "           ┇ 1 ┇ 2 ┇ 3 ┇"
puts "           ▙┅┅┅┻┅┅┅┻┅┅▟"

puts
puts "Welcome to TIC-TAC-TOE by maosan132"
puts "RULES:"
puts "1 - The objective of the game is make a line of 3 tokens vertically, horizontally or diagonally "
puts "2 - First player would be assigned the ╳ token and second player the █ token"
puts "3 - Each turn every other player have a move, it must press a keypad number"
puts "4 - When all the positions are filled, either there will be a winner or a tie"
puts  "what's your name?"
# assignment of tokens should be in a player class, I guess
#first_player = gets.chomp
#puts "#{first_player}, you've got the ╳"
puts  "what's your opponent's name?"
#second_player = gets.chomp
#puts "#{second_player}, you've got the █"
puts
puts "Here, you have an empty board:"
#board = [[" ", " ", " "], [" ", " ", " "],[" ", " ", " "] ]
board = Array.new(3,Array.new(3,' '))
#board2 = Array.new(3) { Array.new(3){' '} }
puts board2
# next should belong to a class, to follow DRY principle:
puts
puts "         " + board[0].join(' | ')
puts "        ———┼———┼———" 
puts "         " + board[1].join(' | ')
puts "        ———┼———┼———" 
puts "         " + board[2].join(' | ')
puts
# ends board class
move_request = "Select a numpad key to make your move"
puts move_request
puts 
move = gets.chomp

#make an array of options, each time one option is exhausted, remove it from array
init_opions = [1,2,3,4,5,6,7,8,9]
 
options_left = 


case move.to_i
when 1 then board[2][0] = move
when 2 then puts "hi 2"
when 3 then puts "3"
when 4 then puts "4"
when 5 then puts "5"
when 6 then puts "6"
when 7 then puts "7"
when 8 then puts "8"
when 9 then puts "9"
else
  puts "#{move} is an invalid key"
end

# re-draws board --> calls board class, I guess
puts "this is #{board[2]}"

# board.each do |i|
#   puts "    " + i.join(' | ')
# end
 array = [[1,2],[3,4]]
 puts array[0][1]
puts

def display
puts "+- - - - - -+"
for row in 0..2
# print has to be used when we don't want to output a line break
print "| "
s = @board[row][col]
 if s == EMPTY_POS
 print col + (row * 3) + 1
 print s
print " | "
end
 puts "\n+- - - - - -+"
end
 end

 display
 
 
 
 W: Lint/ScriptPermission: Script file main.rb doesn't have execute permission.