require_relative "../test_helper"

describe GamesController do

  describe ".index" do
    let(:controller) {GamesController.new}

    it "should say no games found when empty" do
      actual_output = controller.index
      expected_output = "No games found. Add a game.\n"
      assert_equal expected_output, actual_output
    end
  end

  describe ".add" do
    let(:controller) {GamesController.new}

    it "should add a game" do
      controller.add("run with scissors")
      assert_equal 1, Game.count
    end

    it "should not add game all spaces" do
      game_name = "       "
      result = controller.add(game_name)
      assert_equal "\"\" is not a valid game name.", result
    end

    it "should only add games that make sense" do
      game_name = "77777777"
      controller.add(game_name)
      assert_equal 0, Game.count
    end

  end

end