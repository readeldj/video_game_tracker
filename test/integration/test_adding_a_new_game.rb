require_relative '../test_helper'

class AddingANewScenarioTest < Minitest::Test
  def test_happy_path_adding_a_game
    shell_output = ""
    expected_output = manage_menu
    test_game = "Double Dragon 2"
    test_system = "windows"
    IO.popen('./video_game_tracker manage', 'r+') do |pipe|
      pipe.puts "1"
      expected_output << "\n** What game would you like to add? **\n"
      pipe.puts test_game
      expected_output << systems_menu
      pipe.puts "1"
      expected_output <<  maturity_menu
      pipe.puts "2"
      expected_output << player_style_menu
      pipe.puts "1"
      expected_output << owner_status_menu
      pipe.puts "1"
      expected_output << "\"#{test_game}\" has been added\n"
      expected_output << manage_menu
      pipe.puts "4"
      expected_output << "1. #{test_game}\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_game
    skip
    shell_output = ""
    happy_game = "Afterburner"
    happy_system = "windows"
    expected_output = manage_menu
    IO.popen('./video_game_tracker manage', 'r+') do |pipe|
      pipe.puts "1"
      expected_output << "What game would you like to add?\n"
      pipe.puts ""
      expected_output << "\"\" is not a valid game name.\n"
      expected_output << "What game would you like to add?\n"
      pipe.puts happy_game
      expected_output << "What game system is this game for?\n"
      pipe.puts happy_system
      expected_output << "\"#{happy_game}\" has been added\n"
      expected_output << manage_menu
      pipe.puts "4"
      expected_output << "1. #{happy_game}\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end