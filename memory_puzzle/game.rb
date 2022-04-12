require_relative 'board'
class Game

    def initialize
        @board = Board.new
        @board.populate
    end

    def play
        while !@board.won?
            @previous_guess = nil
            puts 'enter a position with a comma in between'
            begin 
                @previous_guess = gets.chomp.split(',').map(&:to_i)
                raise 'error' if !@board[@previous_guess].reveal
                @board.render
            rescue
                puts 'enter another position'
                retry
            end
            begin
                @current_guess = gets.chomp.split(',').map(&:to_i)
                raise 'error' if !@board[@current_guess].reveal
                @board.render
            rescue
                puts 'enter another position'
                retry
            end
            unless @board[@previous_guess] == @board[@current_guess]
                @board[@previous_guess].hide
                @board[@current_guess].hide
            end
        end
        puts 'you won'
    end

end

# game = Game.new
# game.play