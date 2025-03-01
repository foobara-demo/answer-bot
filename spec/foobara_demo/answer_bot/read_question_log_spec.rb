RSpec.describe FoobaraDemo::AnswerBot::ReadQuestionLog do
  let(:command) { described_class.new }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }

  it "is successful" do
    expect(outcome).to be_success
    expect(result).to be_an(Array)
  end
end
