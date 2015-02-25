module Hand where

<<<<<<< HEAD
  import Test.HUnit
  import Data.List
=======
>>>>>>> 5e8ec186dacffa6749fc99bb35961aaa563e6ad4
  import Card
  import Game

  {- CLASSES -}

  class HandValue a where
    sumOfHand :: a -> Int
    numberOfCards :: a -> Int
    maximumNumberOfCards :: a -> Int

  {- DATA -}

  data PlayingHand = Hand [PlayingCard] Game

  {- INSTANCES -}

  instance Show PlayingHand where
    show (Hand [] _) = []
    show (Hand (card:xs) game) = show(card) ++ " " ++ show(Hand xs game)

  instance HandValue PlayingHand where
    sumOfHand (Hand [] _) = 0
    sumOfHand (Hand (card:rest) game) = (valueOf card) + (sumOfHand (Hand rest game))

<<<<<<< HEAD
    numberOfCards (Hand cards BJ) = undefined
    maximumNumberOfCards (Hand cards BJ) = NoLimit

  instance Eq PlayingHand where
    (==) (Hand cardsA _) (Hand cardsB _) = cardsA == cardsB

=======
>>>>>>> 5e8ec186dacffa6749fc99bb35961aaa563e6ad4
  -- TODO:
  -- instance Ord PlayingHand where

  {- FUNCTIONS -}

  {-
    TODO
    PURPOSE: Return the card at the supplied position
    HINT: !!
  -}
  cardAtPosition :: PlayingHand -> Int -> PlayingCard
  cardAtPosition (Hand cards _) position = cards !! position

  {-
    PURPOSE: Remove the card and return the new hand.
  -}
<<<<<<< HEAD
  removeCardAtPosition :: PlayingHand -> Int -> PlayingHand
  removeCardAtPosition hand@(Hand cards game) position  = (Hand (delete (cardAtPosition hand position) cards) game)

  {- TESTS -}
  testHand :: PlayingHand
  testHand = (Hand [(Card Diamonds A BJ), (Card Spades (Other 5) BJ), (Card Clubs K BJ), (Card Diamonds (Other 2) BJ)] BJ)

  testCardAtPosition = TestCase $ assertBool "CardAtPosition" ((cardAtPosition testHand 1) == (Card Spades (Other 5) BJ))
  testRemoveCardAtPosition = TestCase $ assertBool "RemoveCardAtPosition" ((removeCardAtPosition testHand 1) == (Hand [(Card Diamonds A BJ), (Card Clubs K BJ), (Card Diamonds (Other 2) BJ)] BJ))

  testListHand = TestList [testCardAtPosition, testRemoveCardAtPosition]
=======
  removeCardAtPosition :: Int -> PlayingHand -> PlayingHand
  removeCardAtPosition position hand = undefined
>>>>>>> 5e8ec186dacffa6749fc99bb35961aaa563e6ad4
