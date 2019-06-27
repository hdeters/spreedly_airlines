class TransactionsController < ApplicationController

    def index
        @transaction = Transaction.new
        @transaction_list = @transaction.get_list()['transactions'].each { |v| v["created_at"] = Date.parse v["created_at"] }
        @filtered_list = @transaction_list.select{|x| ["Purchase", "DeliverPaymentMethod"].include? x["transaction_type"]}
    end

    def new
        @flight = Flight.find(params[:flight_id])
        @id = @flight.id 
        @transaction = Transaction.new
    end

    def create
        @flight = Flight.find(transaction_params[:flight_id])
        @transaction = Transaction.new(transaction_params)
        amount = transaction_params[:amount]
        save_card = transaction_params[:save_card]
        email = transaction_params[:email]
        token = params[:payment_method_token]
        
        if @transaction.valid?
            if @transaction.external
                success = @transaction.purchase_external(token, amount)
                if success && success['transaction']['succeeded'] == true
                    flash["success"] = "Your purchase was successfully delivered!"
                    redirect_to flights_path
                else
                    flash["alert"] = success['transaction']['message']
                    redirect_to action: "new", id: @flight.id
                end
            else
                success = @transaction.purchase_gateway(token, amount, email, save_card)
                if success && success['transaction']['succeeded'] == true
                    flash["success"] = "Your purchase was successful!"
                    redirect_to flights_path
                else
                    flash["alert"] = success['transaction']['message']
                    redirect_to action: "new", id: @flight.id
                end
            end
        else
            flash["alert"] = "Email is required"
            redirect_to action: "new", id: @flight.id
        end
        
     end
     
     def transaction_params
        params.require(:transaction).permit(:email, :flight_id, :amount, :save_card, :external)
     end
end
