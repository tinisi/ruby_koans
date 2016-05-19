require_relative 'dice_set'
require_relative 'greed_scorer'
require_relative 'greed_constants'

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
    turn_score = 0
    scorer = GreedScorer.new()
    i = 1
    while i <= RISK_ROLL_MAP[@risk_tolerance]
      dice = roll(5)
      turn_score += scorer.calculate_score(dice)
      i += 1
      puts i
    end
    turn_score
  end

end