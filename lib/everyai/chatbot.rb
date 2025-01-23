class Everyai
  class Chatbot
    CHATBOT_PATH = "#{Everyai::DOMAIN}/api/v1/chatbots"

    class << self
      def find(chatbot_id)
        url = URI.parse("#{CHATBOT_PATH}/#{chatbot_id}")
        url.query = URI.encode_www_form({
          "token" => Everyai.api_key
        })
        response = Net::HTTP.get_response(url)
        body = JSON.parse(response.body, symbolize_names: true)

        if response.is_a?(Net::HTTPSuccess)
          new(**body)
        else
          body["errors"]
        end
      end
 
      def create(name:, avatar: nil, business_url: nil, business_bio: nil)
        url = URI.parse(CHATBOT_PATH)
        response = Net::HTTP.post_form(url, 
          { "token": Everyai.api_key, 
            "name": name,
            "avatar": avatar,
            "business_url": business_url,
            "business_bio": business_bio,
          })
        body = JSON.parse(response.body, symbolize_names: true)
        if response.kind_of? Net::HTTPSuccess
          new(**body)
        else
          body["errors"]
        end
      end
    end

    attr_reader :response_data, :id, :name, :agent_id, :iframe_code

    def initialize(**data)
      @response_data = data
      @id       = data[:chatbot_id]
      @name     = data[:name]
      @agent_id = data[:agent_id]
      @iframe_code = data[:iframe_code]
    end
  end
end