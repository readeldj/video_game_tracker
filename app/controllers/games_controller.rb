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

    def edit
    game = Game.all
    games_controller = GamesController.new
    say("Which game would you like to edit?")
    say(games_controller.index)
    say("\nWhich game would you like to edit, just type the number and Enter?")
    game_index = ask('')
    while game_index.empty? or game_index.nil?
      puts "'#{game_index}' isn't a game!"
      say(games_controller.index)
      say("\nWhich game would you like to edit, just type the number and Enter?")
      game_index = ask('')
    end
    game_index = game_index.to_i - 1
    game = game[game_index]
    choose do |menu|
      menu.prompt = ""

      menu.choice('Edit the Game Name') do
        game.name = ask("What is the new name?")
        while game.name.empty?
          game.name = ask("What is the new name?")
        end
        if game.save_name
          say("Your Game Name has been updated!")
          say(games_controller.index)
          return
        else
          say(game.errors)
        end
      end

      menu.choice('Edit the System Type') do
        game.system = ask ("\n** Enter Game System Type By Choosing One Of The Following **\n" +
          "1. Wii U\n" +
          "2. XBox 360\n" +
          "3. Play Station 3\n" +
          "4. iOS (iPad or iPhone)\n" +
          "5. Windows OS\n" +
          "6. Mac OS X\n" +
          "7. Nintendo DS\n" +
          "8. Wii\n")
        while game.system.empty?
          game.system = ask("What is the new System Type?")
        end
        if game.save_system
          say("Your System Type has been updated!")
          say(games_controller.index)
          return
        else
          say(game.errors)
        end
      end

      menu.choice('Edit the Maturity Rating') do
        game.maturity = ask ("\n** Enter Game Maturity Rating **\n" +
          "1. eC - Early Childhood\n" +
          "2. E - Everyone\n" +
          "3. 10+ E - Everyone 10+\n" +
          "4. T - Teen\n" +
          "5. M - Mature 17+\n" +
          "6. Ao - Adults Only 18+\n" +
          "7. RP - Rating Pending\n")
        while game.maturity.empty?
          game.maturity = ask("What is the new Maturity Rating?")
        end
        if game.save_maturity
          say("Your Maturity Rating has been updated!")
          say(games_controller.index)
          return
        else
          say(game.errors)
        end
      end

      menu.choice('Edit the Player Style') do
        game.style = ask ("\n** Enter Game Player Style **\n" +
          "1. Single Player\n" +
          "2. MultiPlayer\n" +
          "3. MultiPlayer/Online\n")
        while game.style.empty?
          game.style = ask("What is the new Player Style?")
        end
        if game.save_style
          say("Your Player Style has been updated!")
          say(games_controller.index)
          return
        else
          say(game.errors)
        end
      end

      menu.choice('Edit Game Ownership Status') do
        game.ownership = ask ("\n** Ownership Status **\n" +
          "1. Owned\n" +
          "2. Wanted\n")
        while game.ownership.empty?
          game.ownership = ask("What is the Ownership Status?")
        end
        if game.save_ownership
          say("Your Game Ownership has been updated!")
          say(games_controller.index)
          return
        else
          say(game.errors)
        end
      end

      menu.choice('Exit') do
        say("Later!\n")
        exit
      end
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
