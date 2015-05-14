require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
require 'sqlite3'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }

class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM games;")
  end
end

def create_game(name)
  Database.execute("INSERT INTO games (name) VALUES (?)", name)
end

def setup_database
  # @db = SQLite3::Database.new("db/video_game_tracker_test.sqlite")
  Database.execute <<-SQL
  CREATE TABLE IF NOT EXISTS games (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(40) NOT NULL
  );
SQL
end

def main_menu
  "1. List Owned Games - owned\n" +
  "2. List Wanted Games - wanted\n" +
  "3. Manage DB - manage\n" +
  "4. Exit\n"
end