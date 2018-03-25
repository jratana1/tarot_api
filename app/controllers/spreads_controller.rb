class SpreadsController < ApplicationController

  def shuffle
    @cards = Card.all
    @shuffled_cards = @cards.shuffle
    render json: @shuffled_cards
  end

  def three_cards
    @cards = Card.all
    @three_cards = @cards.sample(3)
    render json: @three_cards
  end

  def celtic_cross
    @cards = Card.all
    @celtic_cross_cards = @cards.sample(10)
    render json: @celtic_cross_cards
  end

end