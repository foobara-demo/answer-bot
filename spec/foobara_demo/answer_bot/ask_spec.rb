RSpec.describe FoobaraDemo::AnswerBot::Ask do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }

  let(:inputs) do
    {
      question: "what is the pH of honey?",
      service:
    }
  end
  let(:service) { "open-ai" }

  around do |example|
    FoobaraDemo::AnswerBot::QuestionLogEntry.transaction do
      example.run
    end
  end

  it "is successful", vcr: { record: :once } do
    expect {
      expect(outcome).to be_success
    }.to change(FoobaraDemo::AnswerBot::QuestionLogEntry, :count).by(1)
    expect(result).to match(/honey/i)
  end

  context "when using anthropic" do
    let(:service) { "anthropic" }

    it "is successful", vcr: { record: :once } do
      expect(outcome).to be_success
      expect(result).to match(/honey/i)
    end
  end
end
