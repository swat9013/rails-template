# constant
repo_url = "https://raw.githubusercontent.com/swat9013/rails-template/master/"

@app_name = app_name

get_file_list = %w(
.rubocop.yml
.bundle/config
Dockerfile
docker-compose.yml
nginx/Dockerfile
nginx/conf.d/default.conf
nginx/conf.d/app.conf
nginx/nginx.conf
config/database.yml
config/unicorn.rb
)

get_file_list.each do |path|
  remove_file path
  get "#{repo_url}#{path}", "#{path}"
  gsub_file path, /%app_name%/, @app_name
end

# Gemfile
uncomment_lines 'Gemfile', "gem 'redis'"
gem 'unicorn'

gem_group :development, :test do
  gem 'better_errors'
  gem 'bullet'
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

# install locales
remove_file 'config/locales/en.yml'
get 'https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/en.yml', 'config/locales/en.yml'
get 'https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml', 'config/locales/ja.yml'

# config/application.rb
application do
  %q{
    config.time_zone = 'Asia/Tokyo'
  }
end

# run
run 'touch Gemfile.lock'

after_bundle do
  # git
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
