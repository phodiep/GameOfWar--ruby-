require "StandardDeck"
require "test/unit"

puts "\n========== Unit Test - Standard Deck of Cards =========="

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


class TestCard < Test::Unit::TestCase

	def test_simple_lowCard
		cardSuit = "Hearts"
		cardFace = 2
		
		assert_equal(2, Card.new(cardSuit, cardFace).face)
		assert_not_equal(3, Card.new(cardSuit, cardFace).face)

		assert_equal("Hearts", Card.new(cardSuit, cardFace).suit)
		assert_not_equal("Clubs", Card.new(cardSuit, cardFace).suit)

		assert_equal(2, Card.new(cardSuit, cardFace).rank)
		assert_not_equal(3, Card.new(cardSuit, cardFace).rank)

		assert_equal("2 of Hearts", Card.new(cardSuit, cardFace).name)
		assert_not_equal("other name", Card.new(cardSuit, cardFace).name)
	end

	def test_simple_faceCard
		cardSuit = "Spades"
		cardFace = "King"
		
		assert_equal("King", Card.new(cardSuit, cardFace).face)
		assert_not_equal(3, Card.new(cardSuit, cardFace).face)

		assert_equal("Spades", Card.new(cardSuit, cardFace).suit)
		assert_not_equal("Clubs", Card.new(cardSuit, cardFace).suit)

		assert_equal(13, Card.new(cardSuit, cardFace).rank)
		assert_not_equal(1, Card.new(cardSuit, cardFace).rank)

		assert_equal("King of Spades", Card.new(cardSuit, cardFace).name)
		assert_not_equal("other name", Card.new(cardSuit, cardFace).name)
	end

	def test_missing
		assert_raise( ArgumentError ) { Card.new(0) }
		assert_raise( ArgumentError ) { Card.new(0, 1, 2) }
	end

	def test_unknownArgument
		cardSuit = "Spades"
		cardFace = "Joker"

		assert_equal(nil, Card.new(cardSuit, cardFace).rank)
	end
end

