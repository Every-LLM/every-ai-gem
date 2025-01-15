class Everyai
  class Agent
    AGENT_PATH = "#{Everyai::DOMAIN}/api/v1/agents"
    AGENT_GENERATION_PATH = "#{AGENT_PATH}/generations"

    class << self
      def find(agent_id)
        url = URI.parse(AGENT_PATH)
        response = Net::HTTP.post_form(url, { "token": Everyai.api_key, "agent_id": agent_id })
        body = JSON.parse(response.body)
        if response.kind_of? Net::HTTPSuccess
          body["results"]
          new(agent_id)
        else
          body["errors"]
        end
      end

      def generate(prompt, model: "llama3.2", **model_options)
        agent_id = model_options[:agent_id]
        options = model_options.except(:agent_id)
        if !agent_id
          { errors: "You need to include an agent id first" }
        end

        agent = new(agent_id)
        agent.generate(prompt, model: model, **model_options)
      end
    end

    attr_reader :agent_id

    def initialize(agent_id)
      @agent_id = agent_id
    end

    def generate(prompt, model: "llama3.2", **model_options)
      url = URI.parse(AGENT_GENERATION_PATH)
      response = Net::HTTP.post_form(url, { "prompt": prompt, "model": model, "token": Everyai.api_key, "agent_id": agent_id, "options": model_options.to_json })
      body = JSON.parse(response.body)
      if response.kind_of? Net::HTTPSuccess
        body["results"]
      else
        body["errors"]
      end
    end
  end
end