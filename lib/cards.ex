defmodule Cards do

  # For documentation creation
  # then run mix docs
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """

  def create_deck do
    values = ["Ace","Two","Three","Four","Five"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]

    # For every element in "suits", assign it to "suit" and do something
    # Similar to JS Map function
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  #  "?" usually used for function that returns True / False
  @doc """
    Determines whether a deck contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contain?(deck,"Ace of Spades")
      true

  """
  def contain?(deck,card) do
    Enum.member?(deck,card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand,deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck,hand_size) do
    Enum.split(deck,hand_size)
  end

  def save(deck,filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename,binary)
  end

  def load(filename) do
    # Pattern matching
    # _reason = unused variable, so we give _
    case File.read(filename) do
      {:ok,binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Filname doesn't exists!"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck,hand_size)

    # The return value from pipe operator is assigned to the FIRST argument
    # This makes us have to write consistent function argument order
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
