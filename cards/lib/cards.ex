defmodule Cards do
  def make_deck() do
    ranks = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
    suits = [ "♣", "♦", "♥", "♠" ]
    for rank <- ranks, suit <- suits, do: {rank, suit}
  end

  def deal_hand(n_cards) do
    Cards.make_deck()
    |> Enum.shuffle()
    |> Enum.take(n_cards)
  end

  def deal_hands(n_cards) do
    Cards.make_deck()
    |> Enum.shuffle()
    |> Enum.chunk_every(n_cards)
  end

end

# IO.inspect Cards.make_deck()
# IO.inspect Cards.deal_hand(13)
IO.inspect Cards.deal_hands(13)
