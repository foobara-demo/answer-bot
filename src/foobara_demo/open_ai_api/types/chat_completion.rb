module FoobaraDemo
  module OpenAiApi
    class ChatCompletion < Foobara::Model
      attributes do
        choices [Choice]
      end
    end
  end
end
