require_relative "../../../open_ai_api/create_chat_completion"

module FoobaraDemo
  module AnswerBot
    module DomainMappers
      module OpenAiApi
        class ChatCompletionToAnswer < Foobara::DomainMapper
          from FoobaraDemo::OpenAiApi::ChatCompletion
          to :string

          def map(chat_completion)
            chat_completion.choices.first.message.content
          end
        end
      end
    end
  end
end
