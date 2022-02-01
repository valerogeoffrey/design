module Characters
  class Definition
    attr_accessor :points, :attacks, :name, :type

    def initialize(attr_definition)
      puts attr_definition.inspect
      attr_definition.each do |name, value|
        public_send("#{name}=", value)
      end
    end

    def create
      Character.new(self)
    end
  end
end
