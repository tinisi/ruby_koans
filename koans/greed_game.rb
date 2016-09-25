require_relative '../koans/greed_constants'

class GreedGame

  attr_accessor :player_1, :player_2, :player_1_score, :player_2_score

  def initialize(player_1, player_2)
    @debug = false
    @player_1 = player_1
    @player_2 = player_2
    @player_1_score = 0
    @player_2_score = 0
  end

  # play rounds until we reach end condition
  # (someone has more than WINNING_SCORE)
  def play_game
    while should_keep_playing
      round
    end
  end

  # each player takes a turn, return early if player 1 reaches winning score
  def round
    @player_1_score += @player_1.turn
    if not should_keep_playing
      return
    end
    @player_2_score += @player_2.turn
  end

  private

  def should_keep_playing
    should_keep_playing = true
    if @player_1_score >= WINNING_SCORE || @player_2_score >= WINNING_SCORE
      should_keep_playing = false
    end
    should_keep_playing
  end

end