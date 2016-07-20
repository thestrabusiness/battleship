#set dimensions and initialize empty 2D array
grid_size = 5
board = Array.new(grid_size) {Array.new(grid_size)}

#fill grid with "O"
board.each do |row| 
  row.map! { |x| x == nil ? "O" : x }
end

def print_board(board)
  board.each do |row|
    row.each do |col|
      print col
      print " "
    end
    puts ""
  end
end

print "*" * 20
print "BATTLESHIP"
puts "*" * 20
puts ""

print_board(board)

number = Random.new
ship_row = number.rand(0..grid_size-1)
ship_col = number.rand(0..grid_size-1)
puts ship_row
puts ship_col

turn = 1
while turn < 5
  print "Turn: "
  puts turn
  guess_row, guess_col = gets.chomp.to_i, gets.chomp.to_i
  
  if guess_row == ship_row and guess_col == ship_col
    puts "Congratulations! You sunk my battleship!"
    break
  else
    if (guess_row < 0 || guess_row > grid_size) || (guess_col < 0 || guess_col > grid_size)
      puts "Oops, that's not on the grid!"
    elsif (board[guess_row][guess_col] == "X")
      puts "You already guessed that coordinate!"
    else
      puts "You missed my battleship!"
      board[guess_row][guess_col] = "X"
      puts "GAME OVER" if turn == 4 end
    end
  turn += 1
  print_board(board)
end