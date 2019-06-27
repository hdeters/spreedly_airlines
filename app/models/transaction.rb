require 'httparty'

class Transaction < ApplicationRecord
  belongs_to :flight
  include HTTParty

  validates :email, presence: true
  validates :amount, presence: true
  
  @@base_uri = 'https://core.spreedly.com/v1'

  def purchase_gateway(token, amt, email, retain)
    purchase_uri = @@base_uri + '/gateways/' + ENV['GATEWAY_TOKEN'] + '/purchase.json'
    response = HTTParty.post(purchase_uri, base_options.merge(
      {
        body: {
        transaction: {
          payment_method_token: token,
          amount: amt,
          currency_code: 'USD',
          retain_on_success: retain,
          email: email
          }
        }.to_json
      }
    ))
    response.parsed_response
  end

  def purchase_external(token, amt)
    deliver_external_uri = @@base_uri + '/receivers/' + ENV['EXTERNAL_TOKEN'] + '/deliver.json'
    response = HTTParty.post(deliver_external_uri, base_options.merge(
      {
        body: {
            delivery: {
              payment_method_token: token,
              url: 'https://spreedly-echo.herokuapp.com',
              headers: 'Content-Type: application/json',
              body: "{ \"amount\": #{amt}, \"card_number\": \"{{credit_card_number}}\" }"
            }
        }.to_json
      }
    ))
    response.parsed_response
  end

  def get_list()
    puts("GET LIST")
    list_uri = @@base_uri + '/gateways/' + ENV['GATEWAY_TOKEN'] + '/transactions.json?order=desc'
    response = HTTParty.get(list_uri, base_options)
    response.parsed_response
  end

  private def base_options
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      basic_auth: {
        username: ENV['SPREEDLY_ENV_KEY'],
        password: ENV['SPREEDLY_SECRET']
      }
    }
  end
end
