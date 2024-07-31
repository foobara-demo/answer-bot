module FoobaraDemo
  module AnswerBot
    class Ask < Foobara::Command
      description "Ask a question and receive the knowledge you seek."

      inputs do
        question :string, :required
      end

      result :string

      def execute
        build_answer
      end

      attr_accessor :answer

      def build_answer
        self.answer = "I don't know!"
      end
    end
  end
end
