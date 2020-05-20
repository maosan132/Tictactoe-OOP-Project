#!/usr/bin/env ruby

# user_interface

# things to be heads up:
# -when the board is full
# -when there's a three line (winner)
# -when there's a tie
# Two classes are clear : board and player, and main.rb will contain game logic from start to end.

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
# display game rules
# ask for player 1 name, converts it to string, creates an instance of Player and assigns it name and X token
puts 'What\'s 1st player name?'
first_player = gets.chomp.to_s.upcase
puts "#{first_player}, you\'ve got the ╳"
puts
# ask for player 2 name, converts it to string, creates an instance of Player and assigns it name and 0 token
puts 'What\'s 2nd player name?'
second_player = gets.chomp.to_s.upcase
puts "#{second_player}, you\'ve got the █"
# instantiate a new empty board object (array of 3 arrays) and displays it on screen
puts
# Now starts the playing, game asks alternativelly to each player what is their call,
# and checks if it is a valid number between 1 to 9 (which comes from an array of options)
# if the choice is not a number or if is a number not available from mentioned array,
# warns the player to reselect a number, else the choice will be both withdrawed from the
# array of options and print it to the screen on the corresponding board position,
# then when game has had 5 moves, start checking if any player has a winning move (from
# an array of arrays with all winning moves) if not keep game running, then checks also
# for a tie if all positions has been taken and there's no winner.
# somebody_won = false
# you_tied = false
moves_counter = 1
puts '<-----Draws an empty board----->'
puts
(0..8).each do
  # array_options = [1,2,3,4,5,6,7,8,9]
  if moves_counter.odd?
    puts "#{first_player}, make a choice"
    # Show available numbers from the updated array of options
    selection = gets.chomp
    selection.to_i
    # moves_counter == 0 only checks if it is a number, not if is an available cell, else
    # make mentioned checks, if ok, assings value to cell position else repeat
    # remove number choice from array of options
    # check if player has made a win move,
    if moves_counter > 4
      puts "#{first_player} has won! congrats!!" + '--> if there\'s a winning move, of course, now breaks'
      # somebody_won = true
      # breaks the loop
      # check if have been reached 9 moves and no winner,
      puts 'there\'s been a tie' + '--> if there is a tie, of course, now breaks'
      # break the  loop
    end
    puts ' '
  else
    puts "#{second_player}, make a choice"
    # Show available numbers from the updated array of options
    selection = gets.chomp
    selection.to_i
    # make mentioned checks, if ok, assings value to cell position else repeat
    # remove number choice from array of options
    # if player has made a win move,
    if moves_counter > 4
      puts "#{second_player} has won! congrats!!" + '--> if there is a winning move, of course, now breaks'
      # somebody_won = true
      # breaks the loop
      # check if have been reached 9 moves and no winner,
      puts 'there is been a tie' + '--> if there\'s a tie, of course, now breaks'
      # break the  loop
    end
    puts
  end
  # displays the updated board
  puts '<-----Draws the updated board----->'
  puts
  moves_counter += 1
end
puts '----------Game Over-------------'
