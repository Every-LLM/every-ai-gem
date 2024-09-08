# Every AI Ruby Gem

The best gem for connecting to every AI model.
Forget about configuring each different model and use our simple and intuitive interface

### Install Gem

To install the gem you can add it your app with the following command

`bundle add everyai`

### Usage

Before you can use the library you must set an API Key if you need to create one visit the [Every LLM Website](https://every-llm.com)

`Everyai.api_key = "my-secret-api-key-123567"`

To use the gem you can simply call the generate method and pass in any chat prompt

`Everyai.generate("Hello Lllama3.1 AI Model")`

By default it uses llama3.1 so if you want to use a different model use the optional model: option

`Everyai.generate("Hello Mixtral AI Model", model: "mixtral")`

You can also use the short hand available methods to interact with specific models

`Everyai.chatgpt("Hey ChatGPT whats going on")`

To list the available models you can use the ls command

`Everyai.ls`


