require_relative "./lib/bootsrap"
fight = Fight::FightBuilder.new.build
fight.start_game

class PresenceError < StandardError ;end
class Test
  def initialize(a = {})
    return {status: :presence_error} if a.empty?
  end

  def set_a(a = {})
    raise PresenceError if a.empty?
  rescue PresenceError => _
    {status: :presence_error}
  end
end


raise
fight = Fight::FightManager.new(fighters: [player_one, player_two]).start_game




fight.add_fighters([a,b])
fight.start_game




player_one.fight_with(b).attack(:none)
player_one.fight_with(b).attack(:none)
player_two.fight_with(a).attack(:none)
msg = a.fight_with(b).attack(:none)

player_one.attack(:avada_kedavra)
player_two.attack(:avada_kedavra)
player_one.attack(:none)


puts Fight::Character.new.inspect




