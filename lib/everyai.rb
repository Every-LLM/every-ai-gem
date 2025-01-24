require 'net/http'
require 'uri'
require 'json'

class Everyai
  DOMAIN = "https://every-llm.com" 
  #DOMAIN = "http://localhost:3000"
  API_GENERATIONS_PATH = "#{DOMAIN}/api/v1/generations"

  class << self
    @api_key = nil

    def api_key=(key)
      @api_key = key
    end

    def api_key
      @api_key
    end
      
    def generate(prompt, model: "llama3.2", **model_options)
      url = URI.parse(API_GENERATIONS_PATH)
      response = Net::HTTP.post_form(url, { "prompt": prompt, "model": model, "token": api_key, "options": model_options.to_json })
      body = JSON.parse(response.body)
      if response.kind_of? Net::HTTPSuccess
        body["results"]
      else
        body["errors"]
      end
    end

    def chatgpt(prompt, model: "chatgpt")
      generate(prompt, model: model )
    end

    def llama(prompt, model: "llama3.2", context: nil)
      generate(prompt, model: model, context: context)
    end

    def anthropic(prompt, model: "anthropic")
      generate(prompt, model: model)
    end
  end
end

require_relative 'everyai/agent'
require_relative 'everyai/chatbot'
