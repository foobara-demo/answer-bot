module FoobaraDemo
  module AnswerBot
    class Ask < Foobara::Command
      description "Ask a question and receive the knowledge you seek."

      inputs do
        question :string, :required, description: "whatever you want to know!"
      end

      result :string

      depends_on OpenAiApi::CreateChatCompletion

      def execute
        run_ai_service
        build_answer

        answer
      end

      attr_accessor :response, :answer

      def run_ai_service
        inputs = {
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

        self.response = run_subcommand!(OpenAiApi::CreateChatCompletion, inputs)
      end

      def build_answer
        self.answer = response.choices.first.message.content
      end
    end
  end
end
