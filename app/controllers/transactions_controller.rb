class TransactionsController < ApplicationController

    def index
        @transaction_list = Purchaser.new().get_list()['transactions'].each { |v| v['created_at'] = Date.parse v['created_at'] }
        @filtered_list = @transaction_list.select{|x| ['Purchase', 'DeliverPaymentMethod'].include? x['transaction_type']}
    end

    def create
        save_card = params[:save_card] === 'true'
        use_expedia = params[:use_expedia] === 'true'
        token = params[:token]
        amount = params[:price].to_i
        
        if use_expedia
            success = Purchaser.new().purchase_external(token, amount)
            if success && success['transaction']['succeeded'] == true
                flash['success'] = 'Your purchase was successfully delivered!'
                redirect_to flights_path
            else
                flash['alert'] = success['transaction']['message']
                redirect_to flights_path
            end
        else
            success = Purchaser.new().purchase_gateway(token, amount, save_card)
            if success && success['transaction']['succeeded'] == true
                flash['success'] = 'Your purchase was successful!'
                redirect_to flights_path
            else
                flash['alert'] = success['transaction']['message']
                redirect_toflights_path
            end
        end

     end
end
