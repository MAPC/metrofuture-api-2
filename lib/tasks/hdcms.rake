namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app metrofuture-api-2 --confirm metrofuture-api-2
      heroku run rake db:migrate --app metrofuture-api-2
      heroku run rake db:seed --app metrofuture-api-2')
  end
end
