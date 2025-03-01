module FoobaraDemo
  module AnswerBot
    class Ask < Foobara::Command
      description "Ask a question and receive the knowledge you seek."

      inputs do
        question :string, :required, description: "whatever you want to know!"
        service :string, one_of: %w[open-ai anthropic], default: "open-ai"
      end

      result :string

      depends_on OpenAiApi::CreateChatCompletion,
                 Foobara::Ai::AnthropicApi::CreateMessage,
                 DomainMappers::OpenAiApi::QuestionToCreateChatCompletion,
                 DomainMappers::AnthropicApi::QuestionToCreateMessage

      depends_on_entity QuestionLogEntry

      def execute
        determine_ai_command
        run_ai_service
        build_answer
        log_question

        answer
      end

      attr_accessor :ai_command, :response, :answer, :log_entry

      def determine_ai_command
        self.ai_command = if service == "open-ai"
                            OpenAiApi::CreateChatCompletion
                          else
                            Foobara::Ai::AnthropicApi::CreateMessage
                          end
      end

      def run_ai_service
        self.response = run_mapped_subcommand!(ai_command, question)
      end

      def build_answer
        self.answer = domain_map(response)
      end

      def log_question
        self.log_entry = QuestionLogEntry.create(question:, answer:, asked_at: Time.now)
      end
    end
  end
end
