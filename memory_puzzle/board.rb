require_relative "card"

class Board
    attr_reader :board
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
        new_arr.shuffle!
        (0...4).each do |i|
            (0...4).each do |j|
                @board[i][j] = new_arr.shift
            end
        end
    end

    def render
        @board.each do |mini_array|
            saved = []
            mini_array.each do |card|
                if card.face_up
                    saved << card.face_value
                else
                    saved << "_"
                end
            end
            puts saved.join(' ')
        end
    end

    def [](position)
        @board[position[0]][position[1]]
    end

    def []=(position, value)
        @board[position[0]][position[1]] = value
    end

    def reveal(position)
        card = self[position]
        if card.face_up == false
            card.reveal
            card.face_value
            return true
        end
        false
    end

    def won?
        @board.all? do |miniArray|
            miniArray.all? do |card|
                card.face_up == true
            end
        end
    end
    
end

# game_1 = Board.new
# game_1.play
# p game_1.render
# (0...4).each do |mini|
#     (0...4).each do |mouse|
#         game_1.reveal([mini, mouse])
#     end
# end
# p game_1.render
# p game_1.won?