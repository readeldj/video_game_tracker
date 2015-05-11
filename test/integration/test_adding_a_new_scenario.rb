require_relative '../test_helper'

# *** Start ***
# Usage Example:
# > ./video_game_tracker help
# 1.List Owned Games - owned
# 2.List Wanted Games - wanted
# 3.Manage DB - manage

# *** Manage ***
# > ./video_game_tracker manage
# 1.Add A Game
# 2.Update A Game
# 3.Delete A Game
# 4.List All Games  ## Will return back to this menu
# 5.Exit

### Add new games

# Users will spend their Allowance to buy more games. We will be able to add these to the DB.

# ** Add A Game **
# > 1
# Enter Game Name..

# Enter Game System Type By Choosing One Of The Following
# 1.Wii U
# 2.XBox 360
# 3.Play Station 3
# 4.iOS (iPad or iPhone)
# 5.Windows OS
# 6.Mac OS X
# 7.Nintendo DS
# 8.Wii

# Returned
# 1.Enter Another Game System
# 2.Next Step

# Enter Game Maturity Rating
# 1.eC - Early Childhood
# 2.E - Everyone
# 3.10+ E - Everyone 10+
# 4.T - Teen
# 5.M - Mature 17+
# 6.Ao - Adults Only 18+
# 7.RP - Rating Pending

# Enter Game Player Style
# 1.Single Player
# 2.MultiPlayer
# 3.MultiPlayer/Online

# $..return to previous menu

class AddingANewGameTest < Minitest::Test

  def test_minimum_arguments_required
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker') do |pipe|
      expected_output = "[Help] Run as: ./video_game_tracker help"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_help_argument_not_given
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker blah') do |pipe|
      expected_output = "[Help] Run as: ./video_game_tracker help"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_help_argument_given_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./video_game_tracker help', 'r+') do |pipe|
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