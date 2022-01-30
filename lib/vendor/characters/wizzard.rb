module Characters
    class Wizzard
        attr_accessor :points, :name
        def initialize(name = "Harry Potter", point = 5)
            @name   = name
            @points = point
        end
    end
end