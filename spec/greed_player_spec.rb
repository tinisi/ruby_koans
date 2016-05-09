
require_relative '../koans/greed_player'

describe GreedPlayer do
  it "calls through to DiceSet when roll is called" do
    expect_any_instance_of(DiceSet).to receive(:roll).and_call_original
    player = GreedPlayer.new("", :high)
    expect(player.risk_tolerance).to be :high
    foo = player.roll(2)
  end
end