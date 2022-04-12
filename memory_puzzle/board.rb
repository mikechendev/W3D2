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
        arr1 = ('a'..'h').to_a
        arr2 = ('a'..'h').to_a
    end
end