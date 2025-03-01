source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '3.1.4'

gem 'acts-as-taggable-on'
gem 'coderay'
gem 'coffee-rails', '~> 5.0'
# hack for rails 6: https://stackoverflow.com/a/79361034
gem 'concurrent-ruby', '1.3.4'
gem 'devise'
gem 'pg', '~> 1.2'
gem 'pg_search'
gem 'puma', '~> 3.12'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'redcarpet'
gem 'rails', '~> 7.0.8'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.5'
end

group :development, :test do
  gem 'pry'
  gem 'faker'
  gem 'awesome_print'
  gem 'rspec-rails', '~> 3.6'
  gem "factory_bot_rails"
  gem 'letter_opener'
  # gem 'capybara-email'
  gem 'guard-rspec', require: false
  gem 'terminal-notifier-guard'
  gem 'bullet'
end

group :test do
    gem 'shoulda-matchers'
    # gem 'capybara'
    gem 'database_cleaner'
    gem 'launchy'
    gem 'webmock'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
