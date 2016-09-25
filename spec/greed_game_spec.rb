
require_relative '../koans/greed_game'
require_relative '../koans/greed_player'
require_relative '../koans/greed_constants'

describe GreedGame do

  it "can be initialized with two players" do
    player_1 = GreedPlayer.new('Bob', :low)
    player_2 = GreedPlayer.new('Sue', :high)
    game = GreedGame.new(player_1, player_2)
    expect(game.player_1).to be_instance_of(GreedPlayer)
    expect(game.player_2).to be_instance_of(GreedPlayer)
  end

end
