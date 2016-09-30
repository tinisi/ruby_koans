require File.expand_path(File.dirname(__FILE__) + '/neo')

require_relative 'greed_game'

class AboutGameClass < Neo::Koan

  def test_there_is_a_class_for_the_greed_game
    player_1 = GreedPlayer.new('Bob', :low)
    player_2 = GreedPlayer.new('Sue', :high)
    game_instance = GreedGame.new(player_1, player_2)
    assert_equal GreedGame, game_instance.class
  end

end