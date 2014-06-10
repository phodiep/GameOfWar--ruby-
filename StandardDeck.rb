class Card
	def initialize (suit, face)
		@suit = suit
		@face = face
	end

	def face
		return @face
	end

	def suit
		return @suit
	end

	def rank
		if @face == 'Ace'
			return 14
		elsif @face == 'King'
			return 13
		elsif @face == 'Queen'
			return 12
		elsif @face == 'Jack'
			return 11
		elsif @face.to_i.between?(2,10)
			return @face
		else
			return nil
		end
	end

	def name
		return "#{@face} of #{@suit}"
	end
end

def newDeck
	deck = []
	suits = ['Clubs','Spades','Diamonds','Hearts']
	faces = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

	suits.each do |suit|
		faces.each do |face|
			deck += [Card.new(suit,face)]
		end
	end
	return deck
end

def showCards(cards)
	cards.each do |card|
		puts card.name
	end
end



