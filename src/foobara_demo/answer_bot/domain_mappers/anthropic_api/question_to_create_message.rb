module FoobaraDemo
  module AnswerBot
    module DomainMappers
      module AnthropicApi
        class QuestionToCreateMessage < Foobara::DomainMapper
          from :string
          to Foobara::Ai::AnthropicApi::CreateMessage

          def map(question)
            {
              system: "You are a scientific-minded assistant who answers concisely and precisely.",
              messages: [
                {
                  role: "user",
                  content: question
                }
              ]
            }
          end
        end
      end
    end
  end
end
