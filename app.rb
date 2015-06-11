require_relative "dinner_club.rb"

puts "What is your club's name?"
club_name = gets.chomp

puts "Please enter names of your new dinner club members separated by a comma."
people = gets.chomp

club1 = DinnerClub.new(club_name, people.split(", "))

puts "Would you like to enter a meal date? (Yes/No)"
answer = gets.chomp

while answer == 'Yes'
  puts "When did you go out? (Ex. 06-01-15.1 if it was your first time out that day, 06-01-15.2 if second, etc.)"
  date = gets.chomp
  
  puts "Where did you go out?"
  location = gets.chomp
  
  puts "Please enter who went to this meal separated by a comma"
  attendees = gets.chomp
  
  puts "How much did the meal cost?"
  meal_cost = gets.chomp.to_f
  
  puts "What percentage tip did you leave? (Ex. 18)"
  tip_percentage = gets.chomp.to_i
  
  puts "Did someone treat the meal for the others? (Yes/No)"
  treating = gets.chomp
  
  if treating == 'Yes'
    puts "Who treated?"
    treater = gets.chomp
  end
  
  club1.meal(date: date, location: location, attendees: (attendees.split(", ")), 
  meal_cost: meal_cost, tip_percentage: tip_percentage, treater: treater)
  
  puts 
  puts "To review:"
  club1.list.each do |key, value|
    puts "#{key} has paid #{sprintf("%0.2f", value)} as part of the dinner club"
  end
  
  puts
  puts "Also:"
  club1.outings.each do |key1, value1|
    value1.each do |key2, value2|
      puts "On #{key1}, at #{key2},"
      value2.each {|value| puts value} 
      puts "went to dinner."
      puts 
    end
  end
  
  puts "Would you like to enter another meal? (Yes/No)"
  answer = gets.chomp
  
  treater = nil
end

puts "Okay.  Thanks for using Dinner Club!!!"

