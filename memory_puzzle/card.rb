class Card
    attr_reader :face_up, :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def ==(card_1)
        self.face_value == card_1.face_value
    end

end