
require_relative '../koans/greed_player'
require_relative '../koans/greed_constants'

describe GreedPlayer do

  it "can be initialized with a name and risk tolerance" do
    player = GreedPlayer.new('Bob', :high)
    expect(player.risk_tolerance).to be :high
    expect(player.player_name).to eq('Bob')
  end

  describe 'game play' do
    before do
      # allow_any_instance_of(DiceSet).to receive(:get_up_side).and_return(2)
    end

    it "calls through to DiceSet when roll is called" do
      expect_any_instance_of(DiceSet).to receive(:get_up_side).exactly(4).times
      player = GreedPlayer.new('', :low)
      player.roll(4)
    end

    it "calls through to GreedScorer when turn is called" do
      expect_any_instance_of(GreedScorer).to receive(:calculate_score).exactly(4).times.and_call_original
      player = GreedPlayer.new('', :low)
      player.turn()
    end

    it "rolls the dice an appropriate number of times based on their risk tolerance" do
      expect_any_instance_of(DiceSet).to receive(:get_up_side).exactly(5).times
      player = GreedPlayer.new('', :low)
      player.turn()
      expect(RISK_ROLL_MAP[:low]).to eq(3)
    end

  end


end
