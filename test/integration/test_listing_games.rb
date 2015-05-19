require_relative '../test_helper'

class TestListingGames < Minitest::Test

  def test_listing_no_owned_games
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "1" # List all owned games
      expected_output << "No games found. Add a game.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_listing_multiple_owned_games
    create_game("Minecraft")
    create_game("Skylanders")
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker', 'r+') do |pipe|
      expected_output << main_menu
      pipe.puts "1" # List all owned games
      expected_output << "1. Minecraft\n"
      expected_output << "2. Skylanders\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end