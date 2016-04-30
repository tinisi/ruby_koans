require File.expand_path(File.dirname(__FILE__) + '/neo')

require_relative 'greed_player'

class AboutPlayerClass < Neo::Koan

  def test_there_is_a_class_for_the_greed_player 
    player_instance = GreedPlayer.new("", :high)
    assert_equal GreedPlayer, player_instance.class
  end

  def test_a_greed_player_can_be_initialized_with_a_name_and_risk_tolerance
    player_instance = GreedPlayer.new("Hungry Harry", :high)
    assert_equal player_instance.player_name, "Hungry Harry"
    assert_equal player_instance.risk_tolerance, :high
  end

  def test_a_greed_player_has_a_turn_method_that_returns_a_score
    player_instance = GreedPlayer.new("Hungry Harry", :high)
    score = player_instance.turn
    assert_equal score, 3
  end

end
