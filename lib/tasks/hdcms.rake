namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app swt-metrofuture-api-2 --confirm swt-metrofuture-api-2
      heroku run rake db:migrate --app swt-metrofuture-api-2
      heroku run rake db:seed --app swt-metrofuture-api-2')
  end
end
