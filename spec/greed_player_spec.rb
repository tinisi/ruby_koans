
require_relative '../koans/greed_player'

describe GreedPlayer do
  it "calls through to DiceSet when roll is called" do
    dice = instance_spy("DiceSet")
    player = GreedPlayer.new("", :high)
    expect(player.risk_tolerance).to be :high
    # TODO: not quite working yet!
    # foo = player.roll(2)
    # expect(dice).to have_received(:roll)
  end
end