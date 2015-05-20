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

def create_game(name, system, maturity, style, ownership)
  Database.execute("INSERT INTO games (name, system, maturity, style, ownership) VALUES (?,?,?,?,?)", name, system, maturity, style, ownership)
end

def main_menu
  "1. List Owned Games - owned\n" +
  "2. List Wanted Games - wanted\n" +
  "3. Manage DB - manage\n" +
  "4. Exit\n"
end

def manage_menu
  "\n***  Manage Menu  ***\n" +
  "1. Add A Game\n" +
  "2. Update A Game\n" +
  "3. Delete A Game\n" +
  "4. List All Games\n" +
  "5. Exit\n"
end

def systems_menu
  "\n** Enter Game System Type By Choosing One Of The Following **\n" +
  "1. Wii U\n" +
  "2. XBox 360\n" +
  "3. Play Station 3\n" +
  "4. iOS (iPad or iPhone)\n" +
  "5. Windows OS\n" +
  "6. Mac OS X\n" +
  "7. Nintendo DS\n" +
  "8. Wii\n"
end

def maturity_menu
  "\n** Enter Game Maturity Rating **\n" +
  "1. eC - Early Childhood\n" +
  "2. E - Everyone\n" +
  "3. 10+ E - Everyone 10+\n" +
  "4. T - Teen\n" +
  "5. M - Mature 17+\n" +
  "6. Ao - Adults Only 18+\n" +
  "7. RP - Rating Pending\n"
end

def player_style_menu
  "\n** Enter Game Player Style **\n" +
  "1. Single Player\n" +
  "2. MultiPlayer\n" +
  "3. MultiPlayer/Online\n"
end

def owner_status_menu
  "\n** Ownership Status **\n" +
  "1. Owned\n" +
  "2. Wanted\n"
end