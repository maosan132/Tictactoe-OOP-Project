#!/usr/bin/env ruby

$board = Array.new(9, '-')

# Tells us who the winner is
$winner = false

$game_is_not_over = true

def play_tictactoe
  display_board
  
  while $game_is_not_over
    game_rolling($current_player)
    check_if_game_over
    switch_player
  end

  if $winner == 'X' || $winner == 'O' then puts $winner + ' have won.'
  elsif $winner == false then puts 'You have tied.'
  end
end

def display_board
  puts
  puts ' ' + $board[0] + ' │ ' + $board[1] + ' │ ' + $board[2] + '    ░   1   2   3'
  puts '———┼———┼———' + (' ' * 3) + '░'
  puts ' ' + $board[3] + ' │ ' + $board[4] + ' │ ' + $board[5] + '    ░   4   5   6'
  puts '———┼———┼———' + (' ' * 3) + '░'
  puts ' ' + $board[6] + ' │ ' + $board[7] + ' │ ' + $board[8] + '    ░   7   8   9'
  puts
end

# management of turns
def game_rolling(token)
  # player choice
  print 'Choose a cell number from 1 to 9: '
  cell_choice = gets.chomp.to_i
  
  def valid?()
    cell_choice.to_i.between?(1, 9)
  end


  valid = false
  while !valid
    unless ['1', '2', '3', '4', '5', '6', '7', '8', '9'].include?(cell_choice)
      print 'Choose a cell number from 1 to 9: '
      cell_choice = gets.chomp.to_i
    end

    # array index
    cell_choice = cell_choice.to_i - 1

    # is there a free cell?
    if $board[cell_choice] == '-'
      valid = true
    else
      puts 'Cell unavailable. Try again'
    end
  end

  # current player token
  $board[cell_choice] = token

  display_board
end

def check_if_game_over
  check_if_winner
  check_if_tie
end

def check_if_winner
  row_winner = check_rows_for_winner
  column_winner = check_columns_for_winner
  diagonal_winner = check_diagonals_for_winner

  if row_winner != false
    $winner = row_winner ; puts "debug: there is a row match"
  elsif column_winner != false
    $winner = column_winner ; puts "debug: there is a column match"
  elsif diagonal_winner != false
    $winner = diagonal_winner ; puts "debug: there is a diagonal match"
  else
    $winner = false
  end
end

def check_rows_for_winner
  row_1 = $board[0] == $board[1] && $board[1] == $board[2] && $board[2] != '-'
  row_2 = $board[3] == $board[4] && $board[3] == $board[5] && $board[5] != '-'
  row_3 = $board[6] == $board[7] && $board[7] == $board[8] && $board[8] != '-'
  puts "debug: checkrows - row1 = #{row_1}, row2 = #{row_2}, row3 = #{row_3}"

  $game_is_not_over = false if row_1 || row_2 || row_3
  #  the winner
  if row_1 then $board[0]
  elsif row_2 then $board[3]
  elsif row_3 then $board[6]
  else
    false
  end
end

def check_columns_for_winner
  column_1 = $board[0] == $board[3] && $board[3] == $board[6] && $board[6] != '-'
  column_2 = $board[1] == $board[4] && $board[4] == $board[7] && $board[7] != '-'
  column_3 = $board[2] == $board[5] && $board[5] == $board[8] && $board[8] != '-'
  puts "debug: checkcols - col1 = #{column_1}, col2 = #{column_2}, col3 = #{column_3}"

  $game_is_not_over = false if column_1 || column_2 || column_3

  if column_1 then $board[0]
  elsif column_2 then $board[1]
  elsif column_3 then $board[2]
  else
     false
  end
end

def check_diagonals_for_winner
  # Check if any of the columns have all the same value (and is not empty)
  diagonal_1 = $board[0] == $board[4] && $board[4] == $board[8] && $board[8] != '-'
  diagonal_2 = $board[2] == $board[4] && $board[4] == $board[6] && $board[6] != '-'
  # If any row does have a match, flag that there is a win

  $game_is_not_over = false if diagonal_1 || diagonal_2
  #  the winner
  if diagonal_1 then $board[0]
  elsif diagonal_2 then $board[2]
    # Or  false if there was no winner
  else
    false
  end
end

def check_if_tie
  unless $board.include?('-')
    $game_is_not_over = false
    puts 'debug: board is full, should break now'
    true
  else
    puts 'debug: board is not full, keep playing'
    false
  end
end

def switch_player
  $current_player == 'X' ? $current_player = 'O' : $current_player = 'X'
end

play_tictactoe