class Game

  attr_accessor :name, :system, :maturity, :style, :ownership
  attr_reader :id, :errors

  def self.count
    Database.execute("select count(id) from games")[0][0]
  end

  def initialize(name = nil, system = nil, maturity = nil, style = nil, ownership = nil)
    self.name = name
    self.system = system
    self.maturity = maturity
    self.style = style
    self.ownership = ownership
  end

  def ==(other)
    other.is_a?(Game) && other.id == self.id
  end

  def self.all
    Database.execute("select * from games order by name ASC").map do |row|
      populate_from_database(row)
    end
  end

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
    Database.execute("INSERT INTO games (name, system, maturity, style, ownership) VALUES (?,?,?,?,?)", name, system, maturity, style, ownership)
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
