source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 5.2.2'
gem 'pg'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '>= 4.3.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'bcrypt', '~> 3.1.7'
gem 'paperclip', '~> 6.0'
gem 'aws-sdk-s3', '~> 1.9'
gem 'paperclip-av-transcoder'
gem 'hirb'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pg'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg'
end
