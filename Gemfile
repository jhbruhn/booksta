source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.11'

gem 'Ascii85'

group :production, :staging do
  gem "pg"
end

group :production do
  gem 'rack-google_analytics', :require => "rack/google_analytics"
end

group :development, :test do
  gem "sqlite3"
  gem "rails-erd"
end

# le server
gem 'thin'

gem 'json'

# le user management
gem 'devise'
# le user avatars
gem 'gravtastic'
# le htmlentity converter
gem 'htmlentities'
# le in_place editor
gem 'best_in_place'
# markdown parsing
gem 'redcarpet'
# jquery is cool
gem 'jquery-rails'
# le text-languagedetection
gem 'whatlanguage'
# le javascript thingie
# gem 'turbolinks'
gem 'less-rails'

#l18n
gem 'localeapp'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  #gem 'libv8', '~> 3.11.8'
  # js because of less
  gem 'therubyracer'
  # let's make it ugly!
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end
