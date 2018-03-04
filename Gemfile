source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin'  # For admin Panel
gem 'active_admin_import' #, '3.0.0'  -> For Item Import feature in admin
gem 'active_admin_theme'  # For Admin panel theme
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2' # For better select list in admin panel
gem 'best_in_place', github: 'bernat/best_in_place'  # For onscreen value editing in index page in admin panel
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'exception_notification'
gem 'google_drive', '~> 1.0.5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari' # For Pagination
gem 'mysql2'
gem 'paperclip', '~> 5.2.1' # For image functionality of different models
gem 'puma', '~> 3.7' # App Server
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'mina' # For deployment
  gem 'rack-mini-profiler', require: false
  gem 'rails_best_practices' # Rails code analyzer
  gem 'rubocop', '~> 0.52.1', require: false  # Static code analyzer
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end