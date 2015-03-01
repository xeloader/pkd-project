module Deck where

  import Card
  import Game
  import System.Random
  import Test.HUnit

  {- DATA -}

  {-  REPRESENTATION CONVENTION: ... description of how the datatype represents data ...
      REPRESENTATION INVARIANT:  ... requirements on elements of the datatype that the code preserves at all times ...
     -}

  data PlayingDeck = Deck [PlayingCard]
                   | EmptyDeck

  {- INSTANCES -}

  {-
    PURPOSE: convert every card in a deck into a string and show i nicely.
  -}
  instance Show PlayingDeck where
    show (Deck []) = ""
    show (Deck (card:rest)) = show card ++ show (Deck rest)

  instance Eq PlayingDeck where
    (==) (Deck []) (Deck []) = True
    (==) (Deck (card:deck)) (Deck (cardb:deckb)) = card == cardb && (Deck deck) == (Deck deckb)
    (==) _ _ = False

  {- FUNCTIONS -}

  {-
    createEmptyDeck game
    PURPOSE: Create a playingCard deck with 52 cards, unshuffled.
    PRE:  ... pre-condition on the arguments ...
    POST: ... post-condition on the result, in terms of the arguments ...
    SIDE EFFECTS: ... if any, including exceptions ...
    EXAMPLES: ... especially if useful to highlight delicate issues; also consider including counter-examples ..
  -}

  createEmptyDeck :: Game -> PlayingDeck
  createEmptyDeck game = (Deck [(Card Spades A game) .. (Card Hearts K game)])

  {-
    PURPOSE: Shuffle the supplied deck
  -}
  {- CRED suffleDeck function is taken from
  http://stackoverflow.com/questions/9877969/haskell-functions-to-randomly-order-a-list-not-working-properly-homework-begin -}
  shuffleDeck :: StdGen -> [PlayingCard] -> [PlayingCard]
  shuffleDeck _ []   = []
  shuffleDeck gen xs =
                    let
                        (n,newGen) = randomR (0,length xs -1) gen
                        front = xs !! n
                    in  front : shuffleDeck newGen (take n xs ++ drop (n+1) xs)
  {-
    drawCardFromDeck deck
    PURPOSE: Draw one card from the top of the deck, if there's no more cards
      return InvisibleCard
    PRE:  ... pre-condition on the arguments ...
    POST: ... post-condition on the result, in terms of the arguments ...
    SIDE EFFECTS: ... if any, including exceptions ...
    EXAMPLES: ... especially if useful to highlight delicate issues; also consider including counter-examples ..
  -}

  drawCardFromDeck :: PlayingDeck -> PlayingCard
  drawCardFromDeck EmptyDeck = InvisibleCard
  drawCardFromDeck (Deck (card:_)) = card

  {-
    removeTopCardFromDeck deck
    PURPOSE: Remove drawn card from deck
    PRE:  ... pre-condition on the arguments ...
    POST: ... post-condition on the result, in terms of the arguments ...
    SIDE EFFECTS: ... if any, including exceptions ...
    EXAMPLES: ... especially if useful to highlight delicate issues; also consider including counter-examples ..
  -}

  removeTopCardFromDeck :: PlayingDeck -> PlayingDeck
  removeTopCardFromDeck (Deck (topcard:deck)) = (Deck deck)

  {- TESTS -}

  testDeck :: PlayingDeck
  testDeck =  Deck [Card Spades A BJ,Card Spades (Other 2) BJ,
          Card Spades (Other 3) BJ,Card Spades (Other 4) BJ,
          Card Spades (Other 5) BJ,Card Spades (Other 6) BJ,
          Card Spades (Other 7) BJ,Card Spades (Other 8) BJ,
          Card Spades (Other 9) BJ,Card Spades (Other 10) BJ,
          Card Spades J BJ,Card Spades Q BJ,Card Spades K BJ,Card Clubs A BJ,
          Card Clubs (Other 2) BJ,Card Clubs (Other 3) BJ,
          Card Clubs (Other 4) BJ,Card Clubs (Other 5) BJ,
          Card Clubs (Other 6) BJ,Card Clubs (Other 7) BJ,
          Card Clubs (Other 8) BJ,Card Clubs (Other 9) BJ,
          Card Clubs (Other 10) BJ,Card Clubs J BJ,Card Clubs Q BJ,
          Card Clubs K BJ,Card Diamonds A BJ,Card Diamonds (Other 2) BJ,
          Card Diamonds (Other 3) BJ,Card Diamonds (Other 4) BJ,
          Card Diamonds (Other 5) BJ,Card Diamonds (Other 6) BJ,
          Card Diamonds (Other 7) BJ,Card Diamonds (Other 8) BJ,
          Card Diamonds (Other 9) BJ,Card Diamonds (Other 10) BJ,
          Card Diamonds J BJ,Card Diamonds Q BJ,Card Diamonds K BJ,
          Card Hearts A BJ,Card Hearts (Other 2) BJ,Card Hearts (Other 3) BJ,
          Card Hearts (Other 4) BJ,Card Hearts (Other 5) BJ,
          Card Hearts (Other 6) BJ,Card Hearts (Other 7) BJ,
          Card Hearts (Other 8) BJ,Card Hearts (Other 9) BJ,
          Card Hearts (Other 10) BJ,Card Hearts J BJ,Card Hearts Q BJ,
          Card Hearts K BJ]

  testCreateEmptyDeck = TestCase $ assertBool "createEmptyDeck" ((createEmptyDeck BJ) == testDeck)
  testDrawCardFromDeck = TestCase $ assertBool "drawCardFromDeck" ((drawCardFromDeck testDeck) == (Card Spades A BJ))


  testListDeck = TestList [testCreateEmptyDeck, testDrawCardFromDeck]
