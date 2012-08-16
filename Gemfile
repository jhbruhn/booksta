source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'Ascii85'

group :production, :staging do
  gem "pg"
end

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development, :test do
  gem "sqlite3"
end

# le server
gem 'thin'

gem 'json'

# le user management
gem 'devise'
# le user avatars
gem 'gravtastic'
# le pdf generator
gem 'prawn'
# le htmlentity converter
gem 'htmlentities'
# le in_place editor
gem 'best_in_place'
# markdown parsing
gem 'redcarpet'
# jquery is cool
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # gem 'libv8', '~> 3.11.8'
  # js because of less
  gem 'therubyracer'
  # let's make it ugly!
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end