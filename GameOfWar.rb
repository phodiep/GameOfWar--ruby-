require "StandardDeck"


class Player
	def initialize(name, hand, cardsPlayed)
		@name = name
		@hand = hand
		@cardsPlayed = cardsPlayed
	end

	def name
		return @name
	end

	def hand
		return @hand
	end

	def showCardPlayed
		return @cardsPlayed[-1]
	end

	def loser
		return @hand.empty?
	end

	def playerStats
		return "#{@name} (#{@hand.length})"
	end

	def printCardPlayed
		if @cardsPlayed.empty?
			return playerStats + "\t: -"
		else
			return playerStats + "\t: #{showCardPlayed.name}"
		end
	end

	def playCardFromHand
		if not @hand.empty?
			@cardsPlayed += [@hand.pop]
		end
		printCardPlayed
	end

	def playNCardsFromHand(n=4)
		if @hand.length >= n
			@cardsPlayed += [@hand.pop(n)]
		elsif not @hand.empty?
			


		end
		printCardPlayed

	end

end