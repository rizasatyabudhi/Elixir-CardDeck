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
    {status,binary} = File.read(filename)
    term = :erlang.binary_to_term(binary)
  end
end
