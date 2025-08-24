require_relative "src/version"

Gem::Specification.new do |spec|
  spec.name = "foobara-demo-answer-bot"
  spec.version = FoobaraDemo::AnswerBot::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "No description. Add one."
  spec.homepage = "https://github.com/foobara-demo/answer-bot"
  spec.license = "None specified yet"
  spec.required_ruby_version = ">= #{File.read("#{__dir__}/.ruby-version")}"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.executables += ["answer-bot"]

  spec.executables += ["ask"]

  spec.files = Dir[
    "lib/**/*",
    "src/**/*",
    "LICENSE*.txt",
    "README.md",
    "CHANGELOG.md"
  ]

  spec.add_dependency "puma"
  spec.add_dependency "rackup"
  spec.add_dependency "rerun"
  spec.add_dependency "resque"
  spec.add_dependency "resque-scheduler"

  spec.add_dependency "foobara", ">= 0.1.2", "< 2.0.0"
  spec.add_dependency "foobara-dotenv-loader", "< 2.0.0"
  spec.add_dependency "foobara-rack-connector", "< 2.0.0"
  spec.add_dependency "foobara-redis-crud-driver", "< 2.0.0"
  spec.add_dependency "foobara-remote-imports", "< 2.0.0"
  spec.add_dependency "foobara-resque-connector", "< 2.0.0"
  spec.add_dependency "foobara-resque-scheduler-connector", "< 2.0.0"
  spec.add_dependency "foobara-sh-cli-connector", "< 2.0.0"

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
