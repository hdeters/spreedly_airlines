class FlightsController < ApplicationController

  def index
    @flights = Flight.order(:origin)
  end
end
