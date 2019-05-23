source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'faraday'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'fast_jsonapi'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 5.2.3'
gem 'activerecord-postgis-adapter'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '~> 1.3', require: false
  gem 'capistrano-rvm'
  gem 'guard'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  
  # gem 'rb-fsevent' if `uname` =~ /Darwin/
  group :darwin do
    gem 'rb-fsevent', :require => false
    gem 'guard-pow', :require => false
  end

  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier-guard'
  group :darwin do
    gem 'rb-fsevent', :require => false
  end
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
