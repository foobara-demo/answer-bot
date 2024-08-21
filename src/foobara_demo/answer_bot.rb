require_relative "open_ai_api"

module FoobaraDemo
  module AnswerBot
    foobara_domain!

    foobara_depends_on OpenAiApi
    foobara_depends_on Foobara::Ai::AnthropicApi
  end
end
