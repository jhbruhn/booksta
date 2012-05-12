source 'https://rubygems.org'

gem 'rails', '3.2.2'

group :production, :staging do
  gem "pg"
end

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development, :test do
  gem "sqlite3"
end

gem 'json'
gem 'devise'
gem 'gravtastic'
gem 'prawn'
gem 'htmlentities'
gem 'best_in_place'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'  
end

gem 'jquery-rails'

gem 'redcarpet'

