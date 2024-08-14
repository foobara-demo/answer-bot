require_relative "open_ai_api"

module FoobaraDemo
  module AnswerBot
    foobara_domain!

    foobara_depends_on OpenAiApi
  end
end
