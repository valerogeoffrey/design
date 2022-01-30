require_relative 'fight_master'

class FightMasterWrapper

    def initialize
        @Fighter
    end

    def self.instance
        FightMaster.new
    end
end