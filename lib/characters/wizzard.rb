module Characters
  class Wizzard < Character

    attr_accessor :points, :attacks, :name, :type
    def initialize(*args)
      @attacks = {
        stupefix: 10,
        expeliarmus: 30,
        avada_kedavra: 45,
      }
      super
    end

  end
end