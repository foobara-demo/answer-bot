module FoobaraDemo
  module OpenAiApi
    foobara_register_type :role, :string, one_of: ["system", "user", "assistant"]
  end
end
