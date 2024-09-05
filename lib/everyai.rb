require "ollama-ai"

class Everyai
  attr_reader :client
  def initialize
    @client = Ollama.new(
      credentials: { address: 'http://localhost:11434' },
      opiions: { server_sent_events: true }
    )
  end

  def generate(prompt, model)
    result = client.generate(
      { model: model,
        prompt: prompt }
    )
    result.map { |r| r['response']}.join
  rescue Ollama::Errors::RequestError
    puts "This Ollama model is not installed. Type y to install or any key to continue"
    answer = gets.chomp.downcase
    `ollama run #{model}` if answer == "y"
  end

  class << self
    def generate(prompt, model: "llama3.1")
      @ai ||= new
      @ai.generate(prompt, model)
    end

    def ls
      puts "Listing Ollama AI Models"
      str = `ollama list`
      puts str.split("\n")
    end
  end
end
