require_relative 'Player'

class TicTacToe
  attr_accessor :active_player
	def initialize(player_name_1, player_name_2)
	 @player_1 = Player.new(player_name_1, "X")
   @player_2 = Player.new(player_name_2, "O")
   @board = Array.new(3)
   @board.map! { Array.new(3, "-")}
   @finished = false
   @active_player = @player_1.name < @player_2.name ? @player_1 : @player_2
   puts "Game started, #{@player_1.name} '#{@player_1.marker}' vs. #{@player_2.name} '#{@player_2.marker}'"
  end

  def draw_board
    @board.each do |row| row
      row.each do |spot| spot
        print "#{spot} " 
      end
      puts ""
    end
  end

  def get_active_player
    @active_player
  end

  def put_marker(row, col, player)
    @board[row-1][col-1] = player.marker if @board[row-1][col-1] == "-"
  end

  def next_player
    @active_player = @active_player == @player_1 ? @player_2 : @player_1
  end

  def three_in_a_row?(player)
    return true if @board.any? { |row| row.all? {|marker| marker == player.marker}}
    return true if @board.transpose.any? { |col| col.all? {|marker| marker == player.marker}}
    return true if @board[0][0] == @board[1][1] && @board[0][0] == @board[2][2] && @board[0][0] == player.marker
    return true if @board[0][2] == @board[1][1] && @board[0][2] == @board[2][0] && @board[0][2] == player.marker
    return false
  end

  def board_full?
    return !@board.any? { |row| row.any? { |marker| marker == "-"}}
  end
end

game = TicTacToe.new("Otto", "Miza")
game.draw_board
puts "#{game.active_player.name}'s move, enter a coordinate like so 'X,Y', valid coordinates are row 1-3, column 1-3. I.e. '1,1' is valid, '4,4' is not valid."
input = gets.chomp.strip
while (input != "exit")
  if match = input.match(/([1-3])[,.]([1-3])$/)
    row, col = match.captures
    unless game.put_marker(row.to_i, col.to_i, game.active_player)
      puts "Invalid move, valid coordinates are row 1-3, column 1-3. I.e. '1,1' is valid, '4,4' is not valid."
    else
      if game.three_in_a_row?(game.active_player)
        puts "Congratulations #{game.active_player.name} you have won!"
        game.draw_board
        break
      end
      if game.board_full?
        puts "Game over, it was a tie!"
        game.draw_board
        break
      end
      game.next_player
      puts "#{game.active_player.name}'s move."
    end

    game.draw_board
  end
  input = gets.chomp.strip
end
