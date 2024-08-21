module FoobaraDemo
  module AnswerBot
    module DomainMappers
      module AnthropicApi
        class MessageResultToAnswer < Foobara::DomainMapper
          from Foobara::Ai::AnthropicApi::Types::MessageResult
          to :string

          def map(message)
            message.content.first.text
          end
        end
      end
    end
  end
end
