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
    # if @id.nil?
      Database.execute("INSERT INTO games (name, system, maturity, style, ownership) VALUES (?,?,?,?,?)", name, system, maturity, style, ownership)
      @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end

  def save_name
    Database.execute("UPDATE games SET name = ? WHERE id = ?", name, id)
  end
  def save_system
    Database.execute("UPDATE games SET system = ? WHERE id = ?", system, id)
  end
  def save_maturity
    Database.execute("UPDATE games SET maturity = ? WHERE id = ?", maturity, id)
  end
  def save_style
    Database.execute("UPDATE games SET style = ? WHERE id = ?", style, id)
  end
  def save_ownership
    Database.execute("UPDATE games SET ownership = ? WHERE id = ?", ownership, id)
  end


  def self.delete(game_index)
    Database.execute("DELETE FROM games where id=?", game_index)
    true
  end

  private

  def self.populate_from_database(row)
    game = Game.new
    game.name = row['name']
    g_system= row['system']
    game.system = Database.execute("select console_name from game_systems where id = ?", g_system)[0][0]
    g_maturity = row['maturity']
    game.maturity = Database.execute("select maturity_rating_long from maturity_ratings where id = ?", g_maturity)[0][0]
    g_style = row['style']
    game.style = Database.execute("select player_style from player_styles where id = ?", g_style)[0][0]
    g_ownership = row['ownership']
    game.ownership = Database.execute("select ownership from ownerships where id = ?", g_ownership)[0][0]
    game.instance_variable_set(:@id, row['id'])
    game
  end
end
