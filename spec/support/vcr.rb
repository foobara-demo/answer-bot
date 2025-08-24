require "vcr"

VCR.configure do |config|
  # Scrubbing these by default just in-case they contain any sensitive data
  config.before_record do |interaction|
    if interaction.request.headers["Cookie"]
      interaction.request.headers["Cookie"] = ["<SCRUBBED>"]
    end
    if interaction.response.headers["Set-Cookie"]
      interaction.response.headers["Set-Cookie"] = ["<SCRUBBED>"]
    end
  end
  config.filter_sensitive_data("<SCRUBBED_OPENAI_API_KEY>") { ENV.fetch("OPENAI_API_KEY", nil) }

  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
