source "https://rubygems.org"
ruby File.read("#{__dir__}/.ruby-version")

gemspec

gem "foobara-dotenv-loader"
gem "foobara-rack-connector", github: "foobara/rack-connector"
gem "foobara-redis-crud-driver", github: "foobara/redis-crud-driver"
gem "foobara-remote-imports", github: "foobara/remote-imports"
gem "foobara-sh-cli-connector", github: "foobara/sh-cli-connector"
gem "rackup"
gem "rerun"

gem "rake"

group :development do
  gem "foob"
  gem "foobara-rubocop-rules"
  gem "guard-rspec"
  gem "rubocop-rake"
  gem "rubocop-rspec"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
end

group :test do
  gem "foobara-spec-helpers"
  gem "rspec"
  gem "rspec-its"
  gem "ruby-prof"
  gem "simplecov"
  gem "vcr"
  gem "webmock"
end
