module FoobaraDemo
  module OpenAiApi
    class CreateChatCompletion < Foobara::Command
      URL = "https://api.openai.com/v1/chat/completions".freeze

      inputs do
        model :string, one_of: %w[gpt-4o gpt-4], default: "gpt-4o"
        messages [Message]
      end

      result ChatCompletion

      def execute
        build_request_headers
        build_request_body
        issue_http_request
        parse_response
        build_completion

        completion
      end

      attr_accessor :request_headers, :request_body, :response, :parsed_response, :completion

      def build_request_headers
        self.request_headers = {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{api_token}"
        }
      end

      def api_token
        ENV.fetch("OPENAI_API_KEY", nil)
      end

      def build_request_body
        self.request_body = { model:, messages: }
      end

      def issue_http_request
        uri = URI.parse(URL)
        self.response = Net::HTTP.post(uri, JSON.generate(request_body), request_headers)
      end

      def parse_response
        self.parsed_response = if response.is_a?(Net::HTTPSuccess)
                                 JSON.parse(response.body)
                               else
                                 # :nocov:
                                 raise "Could not get compltion from #{URL} " \
                                       "#{response.code} #{response.body}"
                                 # :nocov:
                               end
      end

      def build_completion
        self.completion = parsed_response.slice("choices")
      end
    end
  end
end
