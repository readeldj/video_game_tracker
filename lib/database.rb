require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS games (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL,
      system integer NOT NULL,
      maturity integer NOT NULL,
      style integer NOT NULL,
      ownership integer NOT NULL,
      FOREIGN KEY (system) REFERENCES game_systems (id),
      FOREIGN KEY (maturity) REFERENCES maturity_ratings (id),
      FOREIGN KEY (style) REFERENCES player_styles (id),
      FOREIGN KEY (ownership) REFERENCES ownerships (id)
    );
    SQL

    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS game_systems (
      id integer PRIMARY KEY AUTOINCREMENT,
      console_name NVARCHAR(30) NOT NULL,
      manufacturer NVARCHAR(30) NOT NULL
    );
    SQL

    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS maturity_ratings (
      id integer PRIMARY KEY AUTOINCREMENT,
      maturity_rating_short NVARCHAR(40) NOT NULL,
      maturity_rating_long NVARCHAR(40) NOT NULL
    );
    SQL

    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS player_styles (
      id integer PRIMARY KEY AUTOINCREMENT,
      player_style NVARCHAR(30) NOT NULL
    );
    SQL

    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS ownerships (
      id integer PRIMARY KEY AUTOINCREMENT,
      ownership BOOLEAN NOT NULL
    );
    SQL

  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = Environment.current
    database = "db/video_game_tracker_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.results_as_hash = true
  end
  ## Not sure how to test this yet. Need to verify it works somehow
end