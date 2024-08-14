require_relative "chat_completion/choice"

module FoobaraDemo
  module OpenAiApi
    class ChatCompletion < Foobara::Model
      attributes do
        choices [Choice]
      end
    end
  end
end
