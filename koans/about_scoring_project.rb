require File.expand_path(File.dirname(__FILE__) + '/neo')
require 'pry'


# Greed is a dice game where you roll up to five dice to accumulate
# points.  The following "score" function will be used to calculate the
# score of a single roll of the dice.
#
# A greed roll is scored as follows:
#
# * A set of three ones is 1000 points
#
# * A set of three numbers (other than ones) is worth 100 times the
#   number. (e.g. three fives is 500 points).
#
# * A one (that is not part of a set of three) is worth 100 points.
#
# * A five (that is not part of a set of three) is worth 50 points.
#
# * Everything else is worth 0 points.
#
#
# Examples:
#
# score([1,1,1,5,1]) => 1150 points
# score([2,3,4,6,2]) => 0 points
# score([3,4,5,3,3]) => 350 points
# score([1,5,1,2,4]) => 250 points
#
# More scoring examples are given in the tests below:
#
# Your goal is to write the score method.
def score(dice)
  scorer = GreedScorer.new(dice)
  scorer.calculate_score()
end

class AboutScoringProject < Neo::Koan
  def test_score_of_an_empty_list_is_zero
    assert_equal 0, score([])
  end

  def test_score_of_a_single_roll_of_5_is_50
    assert_equal 50, score([5])
  end

  def test_score_of_a_single_roll_of_1_is_100
    assert_equal 100, score([1])
  end

  def test_score_of_multiple_1s_and_5s_is_the_sum_of_individual_scores
    assert_equal 300, score([1,5,5,1])
  end

  def test_score_of_single_2s_3s_4s_and_6s_are_zero
    assert_equal 0, score([2,3,4,6])
  end

  def test_score_of_a_triple_1_is_1000
    assert_equal 1000, score([1,1,1])
  end

  def test_score_of_other_triples_is_100x
    assert_equal 200, score([2,2,2])
    assert_equal 300, score([3,3,3])
    assert_equal 400, score([4,4,4])
    assert_equal 500, score([5,5,5])
    assert_equal 600, score([6,6,6])
  end

  def test_score_of_mixed_is_sum
    assert_equal 250, score([2,5,2,2,3])
    assert_equal 550, score([5,5,5,5])
    assert_equal 1100, score([1,1,1,1])
    assert_equal 1200, score([1,1,1,1,1])
    assert_equal 1150, score([1,1,1,5,1])
  end

end

class GreedScorer

  def initialize(dice)
    @dice = dice
    @total_score = 0
    @debug = false
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
    # loop over the solos
    # add to a return value 100 for 1's and 50 for 5's
    significant_solos = get_significant_solos(sorted_dice)
    significant_solos.each_index do |i|
      if significant_solos[i] == 1
        @total_score += 100
      elsif significant_solos[i] == 5
        @total_score += 50
      end
    end

    if @debug
      puts "in score_solos"
      puts @total_score
    end
  end

  def calculate_score()

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
