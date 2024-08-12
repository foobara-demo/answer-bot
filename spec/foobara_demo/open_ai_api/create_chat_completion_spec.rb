RSpec.describe FoobaraDemo::OpenAiApi::CreateChatCompletion do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:errors_hash) { outcome.errors_hash }

  let(:inputs) do
    { messages: }
  end

  let(:messages) do
    [
      {
        role: "system",
        content: "You are a scientific-minded assistant who answers concisely and precisely."
      },
      {
        role: "user",
        content: question
      }
    ]
  end

  let(:question) { "What is the pH of honey?" }

  it "is successful", vcr: { record: :once } do
    expect(outcome).to be_success
    expect(result[:choices][0][:message][:content]).to match(/honey/i)
  end
end
