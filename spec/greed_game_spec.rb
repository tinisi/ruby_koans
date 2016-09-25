
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

  it "plays dice" do
    player_1 = GreedPlayer.new('Bob', :low)
    player_2 = GreedPlayer.new('Sue', :high)
    # this should give us a known score to assert on
    # and will be different based on risk level
    allow(player_1).to receive(:roll).at_least(:once).and_return([1,2,3])
    allow(player_2).to receive(:roll).at_least(:once).and_return([1,2,3])
    game = GreedGame.new(player_1, player_2)
    game.play_game
    expect(game.player_1_score).to eq(600)
    expect(game.player_2_score).to eq(4500)
  end

  it "calls turn on each player" do
    # allow_any_instance_of(GreedPlayer).to receive(:turn).and_return(2999)
    player_1 = instance_double("GreedPlayer")
    player_2 = instance_double("GreedPlayer")
    allow(player_1).to receive(:turn).at_least(:once).and_return(2999)
    allow(player_2).to receive(:turn).at_least(:once).and_return(2999)
    game = GreedGame.new(player_1, player_2)
    game.play_game
    expect(game.player_1).to have_received(:turn).exactly(2).times
    expect(game.player_2).to have_received(:turn).exactly(1).times
  end

end
