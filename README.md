Rails template
==============
## Requirement
Rails 5.1
Docker
Docker-compose

## Usage
```
rails new app_name -BP -d postgresql -m https://raw.githubusercontent.com/swat9013/rails-template/master/template.rb
cd app_name
bundle lock
docker-compose build
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose up
```

## Reference
https://railsguides.jp/rails_application_templates.html
http://www.rubydoc.info/github/wycats/thor/master/Thor/Actions
