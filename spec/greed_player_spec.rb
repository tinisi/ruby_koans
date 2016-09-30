
describe GreedPlayer do

  it "can be initialized with a name and risk tolerance" do
    player = GreedPlayer.new('Bob', :high)
    expect(player.risk_tolerance).to be :high
    expect(player.player_name).to eq('Bob')
  end

  describe 'player' do

    it "calls through to DiceSet when roll is called" do
      expect_any_instance_of(DiceSet).to receive(:get_up_side).exactly(4).times
      player = GreedPlayer.new('', :low)
      player.roll(4)
    end

    it "calls through to GreedScorer when turn is called" do
      expect_any_instance_of(GreedScorer).to receive(:calculate_score).exactly(3).times.and_call_original
      player = GreedPlayer.new('', :low)
      player.turn()
    end

  end

  describe 'game play' do

    it "rolls the dice an appropriate number of times per turn based on risk tolerance" do
      player_risk_level = :low
      expect_any_instance_of(GreedPlayer).to receive(:roll).exactly(RISK_ROLL_MAP[player_risk_level]).times.and_return([1,2,3])
      player = GreedPlayer.new('', player_risk_level)
      score = player.turn()
      expect(score).to eq(600)
    end

  end

end
