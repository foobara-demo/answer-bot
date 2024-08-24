module FoobaraDemo
  module AnswerBot
    class QuestionLogEntry < Foobara::Entity
      attributes do
        id :integer
        question :string, :required
        answer :string
        asked_at :datetime, :required
      end

      primary_key :id
    end
  end
end
