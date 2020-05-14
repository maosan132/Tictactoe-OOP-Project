# user_interface
=begin
1- Present the game to player(s)
2- Draw lines of board
3- Ask for a move and check if it is correct
4- Update the board
5- repeat 3 to 5 until a player has won or both has tied
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
puts "1 - "
puts "2 - "
puts "3 - "
puts "4 - "
puts  "what's your name?"
# assignment of tokens should be in a player class, I guess
#first_player = gets.chomp
#puts "#{first_player}, you've got the ╳"
puts  "what's your opponent's name?"
#second_player = gets.chomp
#puts "#{second_player}, you've got the █"
puts
puts "Here, you have an empty board:"
board = [[" ", " ", " "], [" ", " ", " "],[" ", " ", " "] ]
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