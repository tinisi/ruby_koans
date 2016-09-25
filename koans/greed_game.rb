class GreedGame

  attr_accessor :player_1, :player_2

  def initialize(player_1, player_2)
    @debug = false
    @player_1 = player_1
    @player_2 = player_2
    @player_1_score = 0
    @player_2_score = 0
    @players = [@player_1,@player_2]
  end

  # play_game
  #   entry point, calls a recursive function
  #   stop recursing when 3000 is reached
  def play_game
    while should_keep_playing
      round
    end
  end

  # round
  #   loop over players array
  #   for each player take a turn
  #   set scores for each player
  def round
    puts 'playing!'
  end

  private

  def should_keep_playing
    should_keep_playing = true
    if ( @player_1_score >= 3000 || @player_2_score >= 3000 )
      should_keep_playing = false
    end
    should_keep_playing
  end

end