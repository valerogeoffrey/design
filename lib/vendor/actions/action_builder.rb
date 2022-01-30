require_relative "../actions/action.rb"

module Actions
  class ActionBuilder

    def initialize
      @data = {}
    end

    def hydrate(args)
      @data = args

      self
    end

    def build
      Actions::Action.new.hydrate(@data)
    end
  end
end