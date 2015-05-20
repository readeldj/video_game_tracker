require_relative '../test_helper'



class TestBasicUsage < Minitest::Test

  def test_help_argument_incorrect
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker blah') do |mac|
      expected_output = "[Help] Run as: ./video_game_tracker  with no arguements"
      shell_output = mac.read
    end
    assert_equal expected_output, shell_output
  end

  def test_no_argument_given_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker', 'r+') do |pipe|
      expected_output = <<EOS
1. List Owned Games - owned
2. List Wanted Games - wanted
3. Manage DB - manage
4. Exit
EOS
      pipe.puts "4"
      expected_output << "Later!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_given_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker manage', 'r+') do |pipe|
      expected_output = <<EOS
\n***  Manage Menu  ***
1. Add A Game
2. Update A Game
3. Delete A Game
4. List All Games
5. Exit
EOS
      pipe.puts "5"
      expected_output << "Later!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end