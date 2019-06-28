require 'httparty'

class CardManager
  include HTTParty
  
  @@base_uri = 'https://core.spreedly.com/v1'

  def redact_card(token)
    redact_uri = @@base_uri + '/payment_methods/'+ token + '/redact.json'
    response = HTTParty.put(redact_uri, base_options)
    response.parsed_response
  end

  def get_saved_cards()
    cards_uri = @@base_uri + '/payment_methods.json'
    response = HTTParty.get(cards_uri, base_options)
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
