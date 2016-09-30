
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

  it "calls turn on each player until one of them has a winning score" do
    player_1 = instance_double(GreedPlayer)
    player_2 = instance_double(GreedPlayer)
    allow(player_1).to receive(:turn).at_least(:once).and_return(299)
    allow(player_2).to receive(:turn).at_least(:once).and_return(299)
    game = GreedGame.new(player_1, player_2)
    game.play_game
    # since player 1 goes first, they will win on the 11th turn
    # player 2 should have a score of 2999...so close!
    expect(game.player_1).to have_received(:turn).exactly(11).times
    expect(game.player_2).to have_received(:turn).exactly(10).times
  end

end
