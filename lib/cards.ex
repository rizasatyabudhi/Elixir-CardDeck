defmodule Cards do
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
  def contain?(deck,card) do
    Enum.member?(deck,card)
  end

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
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
