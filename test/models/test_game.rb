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
        create_game("Bob", "3", "2", "1", "2")
        create_game("Sally", "3", "2", "1", "2")
        create_game("Amanda", "3", "2", "1", "2")
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
      it "populates the returned games' ids" do
        expected_ids = Database.execute("SELECT id FROM games order by name ASC").map{ |row| row['id'] }
        actual_ids = Game.all.map{ |game| game.id }
        assert_equal expected_ids, actual_ids
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
        create_game("Bob", "3", "2", "1", "2")
        create_game("Sally", "3", "2", "1", "2")
        create_game("Amanda", "3", "2", "1", "2")
      end
      it "should return the correct count" do
        assert_equal 3, Game.count
      end
    end
  end

  describe "#find" do
    let(:game){ Game.new("Make pancakes", "1", "2", "3", "1") }
    before do
      game.save
    end
    describe "if there isn't a matching game in the database" do
      it "should return nil" do
        assert_equal nil, Game.find(14)
      end
    end
    describe "if there is a matching game in the database" do
      it "should return the game, populated with id and name" do
        actual = Game.find(game.id)
        assert_equal game.id, actual.id
        assert_equal game.name, actual.name
      end
    end
  end

  describe "equality" do
    describe "when the game ids are the same" do
      it "is true" do
        game1 = Game.new("foo", "3", "2", "1", "2")
        game1.save
        game2 = Game.all.first
        assert_equal game1, game2
      end
    end
    describe "when the game ids are not the same" do
      it "is true" do
        game1 = Game.new("foo", "3", "2", "1", "2")
        game1.save
        game2 = Game.new("foo", "3", "2", "1", "2")
        game2.save
        assert game1 != game2
      end
    end
  end

  describe ".initialize" do
    it "sets the name attribute" do
      game = Game.new("foo", "3", "2", "1", "2")
      assert_equal "foo", game.name
    end
  end

  describe ".save" do
    describe "if the model is valid" do
      let(:game){ Game.new("roast a pig", "3", "2", "1", "2") }
      it "should return true" do
        assert game.save
      end
      it "should save the model to the database" do
        game.save
        assert_equal 1, Game.count
        last_row = Database.execute("SELECT * FROM games")[0]
        database_name = last_row['name']
        assert_equal "roast a pig", database_name
      end
      it "should populate the model with id from the database" do
        game.save
        last_row = Database.execute("SELECT * FROM games")[0]
        database_id = last_row['id']
        assert_equal database_id, game.id
      end
    end

    describe "if the model is invalid" do
      let(:game){ Game.new("") }
      it "should return false" do
        refute game.save
      end
      it "should not save the model to the database" do
        game.save
        assert_equal 0, Game.count
      end
      it "should populate the error messages" do # I have some qualms.
        game.save
        assert_equal "\"\" is not a valid game name.", game.errors
      end
    end
  end

  describe ".valid?" do
    describe "with valid data" do
      let(:game){ Game.new("eat corn on the cob") }
      it "returns true" do
        assert game.valid?
      end
      it "should set errors to nil" do
        game.valid?
        assert game.errors.nil?
      end
    end
    describe "with no name" do
      let(:game){ Game.new(nil) }
      it "returns false" do
        refute game.valid?
      end
      it "sets the error message" do
        game.valid?
        assert_equal "\"\" is not a valid game name.", game.errors
      end
    end
    describe "with empty name" do
      let(:game){ Game.new("") }
      it "returns false" do
        refute game.valid?
      end
      it "sets the error message" do
        game.valid?
        assert_equal "\"\" is not a valid game name.", game.errors
      end
    end
    describe "with a name with no letter characters" do
      let(:game){ Game.new("777") }
      it "returns false" do
        refute game.valid?
      end
      it "sets the error message" do
        game.valid?
        assert_equal "\"777\" is not a valid game name.", game.errors
      end
    end
    describe "with a previously invalid name" do
      let(:game){ Game.new("666") }
      before do
        refute game.valid?
        game.name = "Eat a pop tart"
        assert_equal "Eat a pop tart", game.name
      end
      it "should return true" do
        assert game.valid?
      end
      it "should not have an error message" do
        game.valid?
        assert_nil game.errors
      end
    end
    describe ".update" do
      describe "edit previously entered game" do
        let(:game_name){ "Eat a pop tart" }
        let(:new_game_name){ "Eat a toaster strudel" }
        it "should update game name but not id" do
          skip
          game = Game.new(game_name)
          game.save
          assert_equal 1, Game.count
          game.update(game_name, new_game_name)
          last_row = Database.execute("SELECT * FROM games WHERE name LIKE ?", game_name)[0]
          assert_equal 1, Game.count
          assert_equal new_game_name, last_row['name']
        end
      end
    end
  end
end