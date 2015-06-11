require "sqlite3"

class DinnerClubResource
  def initialize(name)
    @CONNECTION = SQLite3::Database.new("#{name}_dinnerclub.db")
    @CONNECTION.results_as_hash = true
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'members' (id INTEGER PRIMARY KEY, name TEXT, total REAL);")
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'outings' (id INTEGER PRIMARY KEY, date TEXT, location TEXT, attendees TEXT);")
    @CONNECTION.execute("CREATE TABLE IF NOT EXISTS 'checksplitter_uses' (id INTEGER PRIMARY KEY, date TEXT, 
    meal_cost REAL, tip_percentage INTEGER, group_number INTEGER);")
  end
  
  def create_member(name, total)
    @CONNECTION.execute("INSERT INTO 'members' (name, total) VALUES ('#{name}', #{total});")
  end
  
  def get_member_by_name(name)
    @CONNECTION.execute("SELECT * FROM 'members' WHERE name = '#{name}';")
  end
  
  def update_member_by_name(name, total)
    @CONNECTION.execute("UPDATE 'members' SET total = #{total} WHERE name = '#{name}';")
  end
  
  def delete_member_by_name(name)
    @CONNECTION.execute("DELETE FROM 'members' WHERE name = '#{name}';")
  end
  
  def create_outing(date, location, attendees)
    @CONNECTION.execute("INSERT INTO 'outings' (date, location, attendees) VALUES ('#{date}', '#{location}', '#{attendees}');")
  end
  
  def get_outing_by_date(date)
    @CONNECTION.execute("SELECT * FROM 'outings' WHERE date = '#{date}';")
  end
  
  def delete_outing_by_date(date)
    @CONNECTION.execute("DELETE FROM 'outings' WHERE date = '#{date}';")
  end
  
  def create_check(date, meal_cost, tip_percentage, group_number)
    @CONNECTION.execute("INSERT INTO 'checksplitter_uses' (date, meal_cost, tip_percentage, group_number) 
    VALUES ('#{date}', #{meal_cost}, #{tip_percentage}, #{group_number});")
  end
  
  def get_check_by_date(date)
    @CONNECTION.execute("SELECT * FROM 'checksplitter_uses' WHERE date = '#{date}';")
  end
  
  def delete_check_by_date(date)
    @CONNECTION.execute("DELETE FROM 'checksplitter_uses' WHERE date = '#{date}';")
  end
  
end