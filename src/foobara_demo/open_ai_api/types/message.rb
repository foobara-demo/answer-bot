require_relative "role"

module FoobaraDemo
  module OpenAiApi
    class Message < Foobara::Model
      attributes do
        role :role, :required
        content :string, :required
        refusal :duck
      end
    end
  end
end
