require_relative "check_splitter.rb"

# Public: Creates a dinner club given a list of names.
# Puts those names in a hash which points to a total of dinner charges for each person.
class DinnerClub
  # Public: Hash of names(keys) and total of dinner charges. Hash of dates(keys) and who and where the outing was.
  attr_reader :list, :outings
  
  # Public: Initializes a new DinnerClub.
  def initialize(names)
    @names = names
    self.names_hash
    @outings = {}
  end
  
  # Public: Creates a hash of the different names in the dinner club.  Each name points to a total amount paid.
  #
  # @names - list of member names
  #
  # Returns a hash with member names pointing to their total amount paid (default: 0.0)
  def names_hash
    @list = Hash.new
    @names.each do |name|
      @list[name] = 0.0
    end
  end
  
  # Public: Calculates the cost per meal.
  #
  # attendees - array of those who attended
  # meal_cost - cost of the meal
  # tip_percentage - percentage value given as a whole number
  #
  # Returns a float added to each attendees total amount
  def meal(date:, location:, attendees: , meal_cost:, tip_percentage: 0.18, treater: nil)
    if treater != nil
      charge = meal_cost*(1 + (tip_percentage/100.0))
      add_charge(treater, charge)
    else
      check1 = CheckSplitter.new(meal_cost: meal_cost, tip_percentage: tip_percentage, group:  x = attendees.length)
      charge = check1.cost_per_person
      attendees.each do |name|
        add_charge(name, charge)
      end
    end
    self.outing(date, location, attendees)
  end
  
  # Public:  Add's a charge to each attendees total.
  #
  # @list - Hash of everyone in the dinner club.
  # name - Name of someone who attended a meal.
  # charge - Amount to add to each attendees total.
  #
  # Returns a float added to each attendees total amount
  def add_charge(name, charge)
    @list[name] += charge
  end
  
  # Public:  Add's a meal to the outing hash.
  #
  # date - date the meal occurred
  # location - where the meal was
  # attendees - who was present for the meal
  #
  # Returns a hash in the outings hash corresponding to the meal.
  def outing(date, location, attendees)
    @outings[date] = {location => attendees}
  end
  
end