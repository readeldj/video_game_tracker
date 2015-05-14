require "highline/import"

class GamesController
  def index
    if Game.count > 0
      games = Game.all # All of the games in an array
      games.each_with_index do |game, index|
        say("#{index + 1}. #{game.name}") #=> 1. Minecraft
      end
    else
      say("No games found. Add a game.\n")
    end
  end
end