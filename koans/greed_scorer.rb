class GreedScorer

  attr_accessor :number_of_non_scoring_dice

  def initialize()
    @dice = []
    @total_score = 0
    @debug = false
    @number_of_non_scoring_dice = 0
  end

  def extract_run_of_three(sorted_dice)
    # returns the number in the run (there can only be one run of three)
    # and removes the segment from the
    run = nil
    run_index = nil

    sorted_dice.each_index do |i|
      # skipping the end points here because we need valid numeric comparisons
      if i != 0 && i+1 < sorted_dice.length
        if sorted_dice[i] == sorted_dice[i-1] && sorted_dice[i] == sorted_dice[i+1]
          run = sorted_dice[i]
          run_index = i
          break
        end
      end
    end

    if run_index
      sorted_dice.slice!(run_index-1,3)
      foo = "faaa"
    end

    if run
      @total_score += score_runs_of_three(run)
    end

    if @debug
      puts "in get_run_of_three"
      puts run.inspect
      puts sorted_dice.inspect
    end

    sorted_dice
  end

  def get_significant_solos(sorted_dice)
    significant_solos = []
    sorted_dice.each_index do |i|
      if sorted_dice[i] == 1 || sorted_dice[i] == 5
        significant_solos.push(sorted_dice[i])
      end
    end

    if @debug
      puts "in get_significant_solos"
      puts significant_solos.inspect
    end

    significant_solos
  end

  def score_runs_of_three(run)
    # return 1000 if the number is 1
    # otherwise return 100 x the number
    score = 0
    if run
      if run == 1
        score += 1000
      else
        score += run * 100
      end
    end

    if @debug
      puts "in score_runs_of_three"
      puts score
    end

    score
  end

  def score_solos(sorted_dice)
    number_remaining_dice = sorted_dice.length
    # loop over the solos
    # add to a return value 100 for 1's and 50 for 5's
    significant_solos = get_significant_solos(sorted_dice)
    significant_solos.each_index do |i|
      if significant_solos[i] == 1
        @total_score += 100
      elsif significant_solos[i] == 5
        @total_score += 50
      end
      number_remaining_dice -= 1
    end

    @number_of_non_scoring_dice = number_remaining_dice

    if @debug
      puts "in score_solos"
      puts @total_score
    end
  end

  def calculate_score(dice)

    @dice = dice

    t_score = 0

    if @debug
      puts ""
      puts "----"
      puts "DICE"
      puts @dice.inspect
    end

    sorted_dice = @dice.sort

    # early out for empty
    if sorted_dice.length == 0
      return t_score
    end

    # this will remove runs from the array, everything else can be just scored
    if sorted_dice.length >= 3
      sorted_dice = extract_run_of_three(sorted_dice)
    end

    score_solos(sorted_dice)

    if @debug
      puts "------"
      puts "SCORE"
      puts @total_score
    end
    @total_score
  end

end
