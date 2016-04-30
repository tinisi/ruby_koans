require File.expand_path(File.dirname(__FILE__) + '/neo')

require_relative 'greed_game'

class AboutGameClass < Neo::Koan

  def test_there_is_a_class_for_the_greed_game
    game_instance = GreedGame.new
    assert_equal GreedGame, game_instance.class
  end

end