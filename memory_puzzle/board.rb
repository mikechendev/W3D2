require_relative "card"

class Board
    
    def initialize
        @board = Array.new(4) {Array.new(4)}
        #size = @board.length * @board[0].length
        #(size / 2).times { Card.new()}
    end

    def render
        @board.each do |el|
            puts el.join(' ')
        end
    end

    def populate
        arr_1 = ('a'..'h').to_a
        arr_1 = arr_1 + arr_1
        new_arr = []
        16.times do 
            character = arr_1.shift
            new_arr << Card.new(character)
        end
        new_arr.each
    end
end