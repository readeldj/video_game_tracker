require "highline/import"

class GamesController
  def index
    if Game.count > 0
      games = Game.all # All of the scenarios in an array
      games_string = "\n** Game Name | System | Rating | Player Style | Ownership **\n\n"
      games.each_with_index do |game, index|
        games_string << "#{index + 1}. #{game.name} | #{game.system} | #{game.maturity} | #{game.style} | #{game.ownership}\n"
      end
      games_string
    else
      "No games found. Add a game.\n"
    end
  end

  def add(name, system, maturity, style, ownership)
    name_cleaned = name.strip
    game = Game.new(name_cleaned, system, maturity, style, ownership)
    if game.save
      "\"#{name}\" has been added\n"
    else
      game.errors
    end
  end

  def delete
    game = Game.all
    games_controller = GamesController.new
    say(games_controller.index)
    say("\nWhich game would you like to delete? Type the number and press Enter.")
    game_index = ask('')
    game_index = game_index.to_i - 1
    game[game_index]
    gone = Game.delete(game[game_index].id)
    if gone
      say("Game number #{game_index+1} has been deleted\n")
    else
      "was not found"
    end
  end
end
