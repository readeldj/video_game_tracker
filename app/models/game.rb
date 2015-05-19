class Game
  attr_accessor :name

#   def self.all
#     Database.execute("select name from games order by name ASC").map do |row|
#       game = Game.new
#       game.name = row[0]
#       game
#     end
#   end

  def self.count
    Database.execute("select count(id) from games")[0][0]
  end

#   def self.create(name)
#     return if /^\d+$/.match(name)
#     if name.empty?
#       raise ArgumentError.new
#     else
#       Database.execute("INSERT INTO GAMES (name) VALUES (?)", name)
#     end
#   end
# end
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  attr_reader :id, :errors
  def initialize(name = nil)
    self.name = name
  end

  def ==(other)
    other.is_a?(Game) && other.id == self.id
  end

  def self.all
    Database.execute("select * from games order by name ASC").map do |row|
      populate_from_database(row)
    end
  end

  # def self.count
  #   Database.execute("select count(id) from games")[0][0]
  # end

  def self.find(id)
    row = Database.execute("select * from games where id = ?", id).first
    if row.nil?
      nil
    else
      populate_from_database(row)
    end
  end

  def valid?
    if name.nil? or name.empty? or /^\d+$/.match(name)
      @errors = "\"#{name}\" is not a valid game name."
      false
    else
      @errors = nil
      true
    end
  end

  def save
    return false unless valid?
    Database.execute("INSERT INTO games (name) VALUES (?)", name)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end

  private

  def self.populate_from_database(row)
    game = Game.new
    game.name = row['name']
    game.instance_variable_set(:@id, row['id'])
    game
  end
end
