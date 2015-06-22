require "sqlite3"
# Creates a resource object that allows a connection to an sql database.
class DinnerClubResource
  # Creates a new instance of DinnerClub Resource and creates a new database with tables if the dont' exist already.
  def initialize(name)
    @CONNECTION = SQLite3::Database.new("#{name}_dinnerclub.db")
    @CONNECTION.results_as_hash = true
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'members' (id INTEGER PRIMARY KEY, name TEXT, total REAL);")
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'outings' (id INTEGER PRIMARY KEY, date TEXT, location TEXT, attendees TEXT);")
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'checksplitter_uses' (id INTEGER PRIMARY KEY, date TEXT, 
    meal_cost REAL, tip_percentage INTEGER, group_number INTEGER);")
  end
  
  # Creates a row in the member table
  #
  # name - string for the member to be entered name
  # total - integer value for the total each member should be set to when created
  #
  # Returns a row to the called table
  def create_member(name, total)
    @CONNECTION.execute("INSERT INTO 'members' (name, total) VALUES ('#{name}', #{total});")
  end
  
  # Gets a row in the member table based on the member's name
  #
  # name - string for the member to be entered name
  #
  # Returns an array of information from the table
  def get_member_by_name(name)
    @CONNECTION.execute("SELECT * FROM 'members' WHERE name = '#{name}';")
  end
  
  # Updates a row in the member table based on the member's name
  #
  # name - string value for the member's name
  # total - float value for the member's total charges
  #
  # Returns an updated row to the table
  def update_member_by_name(name, total)
    @CONNECTION.execute("UPDATE 'members' SET total = #{total} WHERE name = '#{name}';")
  end
  
  # Deletes a row from the member table based on the member name
  #
  # name - string value for the member to be deleted
  #
  # Returns a deleted row from the member table
  def delete_member_by_name(name)
    @CONNECTION.execute("DELETE FROM 'members' WHERE name = '#{name}';")
  end
  
  # Creates a row in the outings table
  #
  # date - string value for the date of the outing
  # location - string value for the location of the outing
  # attendees - string value for the members who attended the outing
  #
  # Returns a row to the called table
  def create_outing(date, location, attendees)
    @CONNECTION.execute("INSERT INTO 'outings' (date, location, attendees) VALUES ('#{date}', '#{location}', '#{attendees}');")
  end
  
  # Gets a row in the outings table based on the selected date
  #
  # date - string value for the desired date
  #
  # Returns an array of information from the table
  def get_outing_by_date(date)
    @CONNECTION.execute("SELECT * FROM 'outings' WHERE date = '#{date}';")
  end
  
  # Creates a row in the checksplitter_uses table
  #
  # date - string value for the date of the outing that used checksplitter
  # meal_cost - int value for the total cost of the meal
  # tip_percentage - int value for the tip
  # group_number - int value for the number who attended
  #
  # Returns a row to the called table
  def create_check(date, meal_cost, tip_percentage, group_number)
    @CONNECTION.execute("INSERT INTO 'checksplitter_uses' (date, meal_cost, tip_percentage, group_number) 
    VALUES ('#{date}', #{meal_cost}, #{tip_percentage}, #{group_number});")
  end
  
  # Gets a row in the checksplitter_uses table based on the selected date
  #
  # date - string value for the desired date
  #
  # Returns an array of information from the table
  def get_check_by_date(date)
    @CONNECTION.execute("SELECT * FROM 'checksplitter_uses' WHERE date = '#{date}';")
  end
  
end