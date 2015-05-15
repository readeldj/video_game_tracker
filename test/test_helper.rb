require 'bundler/setup'
require 'minitest/autorun'
require "minitest/reporters"
require 'rubygems'
require 'sqlite3'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class Minitest::Test
  def setup
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS games (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(255) NOT NULL
    );
    SQL
    Database.execute("DELETE FROM games;")
  end
end

def create_game(name)
  Database.execute("INSERT INTO games (name) VALUES (?)", name)
end

def main_menu
  "1. List Owned Games - owned\n" +
  "2. List Wanted Games - wanted\n" +
  "3. Manage DB - manage\n" +
  "4. Exit\n"
end