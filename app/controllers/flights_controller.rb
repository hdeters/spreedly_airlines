class FlightsController < ApplicationController
  def index
    @flights = Flight.order(:origin)
    @saved_cards = CardManager.new().get_saved_cards['payment_methods']
  end
end
