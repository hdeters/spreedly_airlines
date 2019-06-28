class CardsController < ApplicationController
    def destroy
        token = params[:id]
        success = CardManager.new().redact_card(token)
        redirect_to flights_path
     end
end