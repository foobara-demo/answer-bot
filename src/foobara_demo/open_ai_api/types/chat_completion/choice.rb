require_relative "../message"

module FoobaraDemo
  module OpenAiApi
    class ChatCompletion < Foobara::Model
      class Choice < Foobara::Model
        attributes do
          message Message
          index :duck
          logprobs :duck
          finish_reason :duck
        end
      end
    end
  end
end
