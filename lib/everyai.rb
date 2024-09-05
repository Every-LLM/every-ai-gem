require "ollama-ai"

class Everyai
  class << self
    def generate(prompt, model: "llama3.1")
      client = Ollama.new(
        credentials: { address: 'http://localhost:11434' },
        opiions: { server_sent_events: true }
      )

      result = client.generate(
        { model: model,
          prompt: prompt }
      )
      result.map { |r| r['response']}.join
    end
  end
end
