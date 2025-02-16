module FoobaraDemo
  module AnswerBot
    class ReadQuestionLog < Foobara::Command
      result [QuestionLogEntry]

      def execute
        load_log
        sort_log

        log_entries
      end

      attr_accessor :log_entries

      def load_log
        self.log_entries = QuestionLogEntry.all
      end

      def sort_log
        log_entries.sort_by!(&:asked_at)
      end
    end
  end
end
