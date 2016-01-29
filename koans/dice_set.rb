class DiceSet

  def initialize()
    @debug = false
    @values = []
    # this seeds the random number generator (I think will be used in this class)
    srand 694586
    @random = Random.new
  end

  def roll(number_of_dice)
    unless number_of_dice
      number_of_dice = 1
    end

    roll = []

    i = 0
    while i < number_of_dice do
      roll.push(get_up_side)
      i += 1
    end

    @values = roll

  end

  def get_up_side()
    up = @random.rand(1..6)
    up
  end

  def values
    @values
  end

end