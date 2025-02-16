require_relative "../../../open_ai_api/create_chat_completion"

module FoobaraDemo
  module AnswerBot
    module DomainMappers
      module OpenAiApi
        class QuestionToCreateChatCompletion < Foobara::DomainMapper
          from :string
          to FoobaraDemo::OpenAiApi::CreateChatCompletion

          def map
            {
              messages: [
                {
                  role: "system",
                  content: "You are a scientific-minded assistant who answers concisely and precisely."
                },
                {
                  role: "user",
                  content: question
                }
              ]
            }
          end

          alias question from
        end
      end
    end
  end
end
