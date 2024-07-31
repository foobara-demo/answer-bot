RSpec.describe FoobaraDemo::AnswerBot::Ask do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }

  let(:inputs) do
    { question: "wtf?" }
  end

  it "is successful" do
    expect(outcome).to be_success
    expect(result).to eq("I don't know!")
  end
end
