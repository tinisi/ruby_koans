# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

# loading in all our classes in one place...
require_relative 'greed_game'
require_relative 'greed_player'

class AboutExtraCredit < Neo::Koan

  def test_the_game_can_be_played
    player_1 = GreedPlayer.new('Bob', :low)
    player_2 = GreedPlayer.new('Sue', :high)
    game = GreedGame.new(player_1, player_2)
    game.play_game
    assert game.player_1_score > -1
    assert game.player_2_score > -1
    puts "test_the_game_can_be_played:"
    puts "player_1_score - " + game.player_1_score.to_s
    puts "player_2_score - " + game.player_2_score.to_s
  end

end
