require_relative 'dice_set'
require_relative 'greed_scorer'

class GreedPlayer

  attr_accessor :player_name, :risk_tolerance

  def initialize(player_name, risk_tolerance=:low)
    @debug = false
    @player_name = player_name
    @risk_tolerance = risk_tolerance
  end

  def roll(number_of_dice)
    dice = DiceSet.new
    dice.roll(number_of_dice)
    return dice.values
  end

  def turn()
    # roll and score, return score and number of remaining dice
    return 1
  end

end