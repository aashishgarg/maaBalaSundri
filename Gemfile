source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'google_drive', '~> 1.0.5'
gem 'activeadmin'
gem 'active_admin_theme'
gem 'select2-rails'
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2'
gem 'active_admin_import' #, '3.0.0'
gem 'best_in_place', github: 'bernat/best_in_place'
gem "paperclip", "~> 5.2.1"
gem 'exception_notification'
gem 'devise'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails', '~> 5.1.4'
gem 'mysql2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'mina' # For deployment
end