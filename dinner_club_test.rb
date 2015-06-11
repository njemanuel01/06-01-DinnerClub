require "minitest/autorun"
require_relative "dinner_club.rb"

class DinnerClubTest < Minitest::Test
  #test that the method names_hash returns a hash called list filled with names with values set to 0
  def test_names_hash
    names = ['Bob', 'Susie', 'Claire']
    test = DinnerClub.new(names)
    names.each do |name|
      assert_equal(0, test.list[name])
    end
  end
  
  #test that the meal method add's a charge to a person's total and creates an outing in the outings hash
  def test_meal
    names = ['Bob', 'Susie', 'Claire']
    
    #test to see if charge is added for no treater
    test = DinnerClub.new(names)
    test.meal(date: '06-01-15', location: 'Star', attendees: ['Bob', 'Susie'], meal_cost: 45, tip_percentage: 20, treater: nil)
    assert_equal(27.0, test.list['Bob'])
    assert_equal(27.0, test.list['Susie'])
    
    #test to see if chare is added for treater
    names = ['Bob', 'Susie', 'Claire']
    test = DinnerClub.new(names)
    test.meal(date: '06-01-15', location: 'Star', attendees: ['Bob', 'Susie'], meal_cost: 45, tip_percentage: 20, treater: 'Susie')
    assert_equal(54.0, test.list['Susie'])
    
    #test to see if an outing is added to hash
    names = ['Bob', 'Susie', 'Claire']
    test = DinnerClub.new(names)
    test.meal(date: '06-01-15', location: 'Star', attendees: ['Bob', 'Susie'], meal_cost: 45, tip_percentage: 20, treater: 'Susie')
    assert_equal(['Bob', 'Susie'], test.outings['06-01-15']['Star']) 
  end
end