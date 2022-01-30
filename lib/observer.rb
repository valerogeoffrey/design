require 'singleton'

module Event
  class Observer
    include Singleton

    attr_accessor :subjects

    def self.instance
      @@instance ||= new
    end

    def initialize
      @subjects = []
    end

    def self.add(subject)
      instance.subjects << subject
      instance
    end

    def self.sub

      instance
    end

    def self.update(subject)
      puts subject
      instance
    end

  end
end

Observer = Event::Observer.instance