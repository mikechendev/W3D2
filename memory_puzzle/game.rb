require_relative 'board'
class Game

    def initialize
        @board = Board.new
    end

    def play
        while !@board.won?
            @previous_guess = nil
            puts 'enter a position with a comma in between'
            @previous_guess = gets.chomp.split(',').map(&:to_i)
            @board[@previous_guess].reveal
            @board.render
            puts 'enter another position'
            @current_guess = gets.chomp.split(',').map(&:to_i)
            @board[@current_guess].reveal
            @board.render
            if @board[@previous_guess] != @board[@current_guess]
                @board[@previous_guess].hide
                @board[@current_guess].hide
                @board.render
            end
        end
    end

end

game = Game.new