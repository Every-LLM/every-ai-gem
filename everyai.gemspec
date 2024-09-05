Gem::Specification.new do |s|
  s.name        = "everyai"
  s.version     = "0.0.0"
  s.summary     = "Every AI ruby gem. Connect to any AI model easily"
  s.description = "This ruby gem allows you to connect to any AI model with one simple interface. Never worry about configuration and installing libraries. We make connecting to multiple AI models simple"
  s.authors     = ["Enoch Tamulonis", "Kurt Tamulonis"]
  s.email       = "enochtamulonis@gmail.com"
  s.files       = ["lib/everyai.rb"]
  s.homepage    =
    "https://rubygems.org/gems/everyai"
  s.license       = "MIT"
  s.add_dependency 'ollama-ai', '~> 1.3.0'
  s.metadata["source_code_uri"] = "https://github.com/Every-LLM/every-ai-gem"
end
