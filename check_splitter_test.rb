require "minitest/autorun"
require_relative "check_splitter.rb"

class CheckSplitterTest < Minitest::Test
  # test get_tip_amount returns a float
  def test_get_tip_amount
    meal_cost = 45
    group = 3
    tip_percentage = 20
    meal1 = CheckSplitter.new(meal_cost: meal_cost, group: group, tip_percentage: tip_percentage)
    assert_equal(9.0, meal1.tip_amount)
  end
  
  # test that total_cost returns a float
  def test_total_cost
    meal_cost = 45
    group = 3
    tip_percentage = 20
    tip_amount = meal_cost.to_f * (tip_percentage/100.0)
    meal1 = CheckSplitter.new(meal_cost: meal_cost, group: group, tip_percentage: tip_percentage)
    assert_equal(54.0, meal1.total_cost)
  end
  
  # test that cost_per_person returns a float  
  def test_cost_per_person
    meal_cost = 45
    group = 3
    tip_percentage = 20
    tip_amount = meal_cost.to_f * (tip_percentage/100.0)
    meal1 = CheckSplitter.new(meal_cost: meal_cost, group: group, tip_percentage: tip_percentage)
    assert_equal(18.0, meal1.cost_per_person)
  end
end
