require_relative "card"

def populate
    arr_1 = ('a'..'h').to_a
    arr_1 = arr_1 + arr_1
    new_arr = []
    16.times do 
        character = arr_1.shift
        new_arr << Card.new(character)
    end
    new_arr.each { |el| puts el.face_value }
end

populate