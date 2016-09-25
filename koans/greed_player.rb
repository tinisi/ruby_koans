require_relative 'dice_set'
require_relative 'greed_scorer'
require_relative 'greed_constants'

class GreedPlayer

  attr_accessor :player_name, :risk_tolerance

  def initialize(player_name, risk_tolerance=:low)
    @debug = false
    @player_name = player_name
    @risk_tolerance = risk_tolerance
    @in_the_game = false
    @dice = DiceSet.new
  end

  def roll(number_of_dice)
    @dice.roll(number_of_dice)
    return @dice.values
  end

  def turn
    turn_score = 0
    final_score = 0
    num_remaining_dice = NUM_DICE
    scorer = GreedScorer.new
    i = 1
    while i <= RISK_ROLL_MAP[@risk_tolerance]
      dice = roll(num_remaining_dice)
      turn_score += scorer.calculate_score(dice)
      if @debug
        puts 'in turn'
        puts dice.inspect
        puts scorer.number_of_non_scoring_dice
      end
      num_remaining_dice = scorer.number_of_non_scoring_dice
      i += 1
    end
    if should_score_count(turn_score)
      final_score = turn_score
    end
    final_score
  end

  private

  def should_score_count(score)
    score_should_count = false
    if @in_the_game or score > IN_THE_GAME_MIN
      @in_the_game = true
      score_should_count = true
    end
    score_should_count
  end


end