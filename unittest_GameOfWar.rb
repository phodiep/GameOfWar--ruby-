require "GameOfWar"
require "test/unit"

puts "\n========== Unit Test - Game of War =========="

class TestPassFail < Test::Unit::TestCase
	def test_pass
		assert_equal(2, 2)
		assert_equal("abc", "abc")
		assert_equal(nil, nil)
		assert_not_equal(2, 3)
	end

	def test_fail
		assert_equal(2, 3, "Forced failure ( 2 != 3 )")
	end
end


class TestPlayer < Test::Unit::TestCase

	def test_simplePlayer
		assert_equal("Player 1", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).name)
		assert_not_equal("MyName", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).name)

		assert_equal("2 of Hearts", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).hand[0].name)
		assert_not_equal("King of Diamonds", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).hand[0].name)

		assert_equal("King of Clubs", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).showCardPlayed.name)
		assert_not_equal("2 of Spades", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).showCardPlayed.name)

		assert_equal(true, 
			Player.new("Player 1", [], [Card.new("Clubs", "King")]).loser)
		assert_equal(false, 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).loser)
	
		assert_equal("Player 1 (1)", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).playerStats)
		assert_equal("Player 1 (0)", 
			Player.new("Player 1", [], [Card.new("Clubs", "King")]).playerStats)

		# show card played
		assert_equal("Player 1 (1)\t: King of Clubs", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).printCardPlayed)
		assert_equal("Player 1 (0)\t: King of Clubs", 
			Player.new("Player 1", [], [Card.new("Clubs", "King")]).printCardPlayed)
		assert_equal("Player 1 (0)\t: -", 
			Player.new("Player 1", [], []).printCardPlayed)

		# play card from hand
		assert_equal("Player 1 (0)\t: 2 of Hearts", 
			Player.new("Player 1", [Card.new("Hearts", 2)], [Card.new("Clubs", "King")]).playCardFromHand)
		assert_equal("Player 1 (0)\t: -", 
			Player.new("Player 1", [], []).playCardFromHand)
				


	end



end
