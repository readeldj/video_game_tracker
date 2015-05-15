require_relative '../test_helper'

describe Game do
  describe "#all" do
    describe "if there are no games in the database" do
      it "should return an empty array" do
        assert_equal [], Game.all
      end
    end
    describe "if there are games" do
      before do
        create_game("Bob")
        create_game("Sally")
        create_game("Amanda")
      end
      it "should return an array" do
        # You don't need to be pedantic like this.
        # This is just an example to remind you that you can use multiple "its"
        assert_equal Array, Game.all.class
      end
      it "should return the games in alphabetical order" do
        expected = ["Amanda", "Bob", "Sally"]
        actual = Game.all.map{ |game| game.name }
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no games in the database" do
      it "should return 0" do
        assert_equal 0, Game.count
      end
    end
    describe "if there are games 2" do
      before do
        create_game("Bob")
        create_game("Sally")
        create_game("Amanda")
      end
      it "should return the correct count" do
        assert_equal 3, Game.count
      end
    end
  end
end