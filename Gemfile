source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "devise_token_auth", "~> 1.2"
gem "active_model_serializers", "~> 0.10.13"
gem 'kaminari'
gem 'rack-cors'
gem 'sidekiq'
gem "sidekiq-cron"


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "byebug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem "letter_opener", "~> 1.8"
  gem 'annotate'
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end