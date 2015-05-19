require "highline/import"

class GamesController
  def index
    # if Game.count > 0
    #   games = Game.all # All of the games in an array
    #   games.each_with_index do |game, index|
    #     say("#{index + 1}. #{game.name}") #=> 1. Minecraft
    #   end
    # else
    #   say("No games found. Add a game.\n")
    # end
    if Game.count > 0
      games = Game.all # All of the scenarios in an array
      games_string = ""
      games.each_with_index do |game, index|
        games_string << "#{index + 1}. #{game.name}\n" #=> 1. Eat a pencil
      end
      games_string
    else
      "No games found. Add a game.\n"
    end
  end

  # def add(name)
  #   name_cleaned = name.strip
  #   Game.create(name_cleaned)
  #   "\"#{name}\" has been added\n"
  # end

  def add(name)
    name_cleaned = name.strip
    game = Game.new(name_cleaned)
    if game.save
      "\"#{name}\" has been added\n"
    else
      game.errors
    end
  end
end


