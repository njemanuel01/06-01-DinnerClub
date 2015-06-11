# Public:  Uses the meal cost and tip amount to calculate the cost per person of a meal shared.
class CheckSplitter 
  attr_reader :tip_amount
  # Public: Initializes a new Checksplitter.
  def initialize(meal_cost:, group:, tip_percentage: 0.18)
    @meal_cost = meal_cost.to_f
    @group = group.to_f
    self.get_tip_amount(tip_percentage, meal_cost)
  end
  
  # Public: Calculates the tip amount.
  #
  # tip_perctange - percentage amount given as a whole number
  # meal_cost -  cost of meal
  #
  # Returns a float for the tip amount to be added to meal cost.
  def get_tip_amount(tip_percentage, meal_cost)
    @tip_amount = meal_cost*(tip_percentage/100.0)
  end
  
  # Public: Calculates the total cost of the meal.
  #
  # meal_cost - cost of meal
  # tip_amount - amount of tip
  #
  # Returns a float for the total cost of meal
  def total_cost
    @meal_cost + @tip_amount
  end
  
  # Public: Calculates the cost per person.
  #
  # total_cost - total cost of meal
  # group - number of people at the meal
  #
  # Returns the cost per person attending the meal.
  def cost_per_person
    self.total_cost / @group
  end 
end