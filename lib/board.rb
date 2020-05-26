
def initialize
  # board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  # board = %W(\s \s \s \s \s \s \s \s \s)
  board = Array.new(9, ' ')
end

def display
  puts
  puts ' ' + board[0] + ' │ ' + board[1] + ' │ ' + board[2] + '    ░   1   2   3'
  puts '———┼———┼———' + (' ' * 3) + '░'
  puts ' ' + board[3] + ' │ ' + board[4] + ' │ ' + board[5] + '    ░   4   5   6'
  puts '———┼———┼———' + (' ' * 3) + '░'
  puts ' ' + board[6] + ' │ ' + board[7] + ' │ ' + board[8] + '    ░   7   8   9'
  puts
end