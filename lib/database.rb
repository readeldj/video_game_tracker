require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS games (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    @@db = SQLite3::Database.new("db/video_game_tracker_test.sqlite")
  end
end


    # environment = ENV["TEST"] ? "test" : "production"
    # database = "db/would_you_rather_#{environment}.sqlite"
    # @@db = SQLite3::Database.new(database)