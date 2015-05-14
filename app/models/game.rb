class Game
  attr_accessor :name

  def self.all
    Database.execute("select name from games order by name ASC").map do |row|
      scenario = Game.new
      scenario.name = row[0]
      scenario
    end
  end

  def self.count
    Database.execute("select count(id) from games")[0][0]
  end

  def self.create(name)
    if name.empty?
      raise ArgumentError.new
    else
      Database.execute("INSERT INTO GAMES (name) VALUES (?)", name)
    end
  end
end