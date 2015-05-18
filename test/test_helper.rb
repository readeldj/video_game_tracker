require 'bundler/setup'
require 'minitest/autorun'
require "minitest/reporters"
require 'rubygems'
require 'sqlite3'
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class Minitest::Test
  def setup
    Database.load_structure
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

def manage_menu
  "1. Add A Game\n" +
  "2. Update A Game\n" +
  "3. Delete A Game\n" +
  "4. List All Games\n" +
  "5. Exit\n"
end