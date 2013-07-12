source 'https://rubygems.org'

ruby "1.9.3"
gem 'pg'

gem 'rails', '~>3.2.13'
gem 'decent_exposure',      '~> 1.0.2'
gem "simple_form",          "2.0.1"
gem "devise",               "2.0.4"
gem "audited-activerecord", "~> 3.0.0.rc1"
gem 'jquery-rails',         '~> 2.0.2'
gem 'jquery-ui-rails',      '~> 2.0.0'
gem 'thin'#,              '~> 1.3.1'

group :assets do
  gem 'therubyracer', :platform => :ruby
  gem 'coffee-rails',   '~> 3.2.1'
  gem 'sass-rails',     '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'uglifier',       '>= 1.0.3'
end

# Deploy with Capistrano
group :development do
  gem 'capistrano', '2.8.0'
  gem 'capistrano-ext', '1.2.1'
end

group :development, :test do
  gem "ecrails_templates", :git => "https://github.com/edgecase/ecrails_templates.git"
  gem "rake",              '~> 0.9.2.2'
  gem "rspec-rails",       '~> 2.9.0'
  gem "jasminerice",       '~> 0.0.9'
  gem 'capybara',          '~> 1.1.2'
  gem 'poltergeist',       '~> 0.6.0'
  gem 'launchy',           '~> 2.1.0'
  gem 'database_cleaner',  '~> 0.8.0'
  gem 'machinist',         '~> 2.0.0'
  gem 'guard',             '~> 1.1.1'
  gem 'rb-fsevent',        '~> 0.9.1'
  gem 'guard-livereload',  '~> 1.0.0'
  gem 'guard-rspec',       '~> 1.2.1'
  gem 'guard-jasmine',     '~> 1.7.0'
  gem 'pry-rails',         '~> 0.1.6'
  gem 'shoulda-matchers',  '~> 1.3.0'
  gem 'railroady',         '~> 1.1.0'
  gem 'cucumber-rails',    '~> 1.3.0', require: false
end

group :production do
  gem 'unicorn'
end
