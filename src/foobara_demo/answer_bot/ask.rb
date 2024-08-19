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
        self.response = run_mapped_subcommand!(OpenAiApi::CreateChatCompletion, question)
      end

      def build_answer
        self.answer = domain_map(response)
      end
    end
  end
end
