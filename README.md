# README


# Region Maps
Region maps used for the top banner of the locatio lists reside in amazon s3 and are named by the 2 letter state/province key in the location_options helper.


# AMAZON S3

## Sync Buckets
aws s3 sync s3://goxperia-staging s3://goxperia


# HEROKU TASKS

### Update Heroku Site
Push to master branch and then manually deploy from Heroku

### Rails Console
heroku run rails console --app goxperia-staging

### Restart Rails
heroku restart --app goxperia-staging

### Create User
heroku run rails console -a goxperia-staging
AdminUser.create(:email => 'support@bustout.com', :password => 'bustoutpassword', :password_confirmation => 'bustoutpassword')

### Run Database Seed
heroku run rake db:seed --app goxperia-staging

### Run Database Migration
heroku run rake db:migrate --app goxperia-staging

### Reset Database
heroku pg:reset --app goxperia-staging
heroku run rake db:migrate --app goxperia-staging
heroku run rake db:seed --app goxperia-staging

### Buildpack Order (Missing Images on Heroku)
heroku buildpacks:clear  --app goxperia-staging
heroku buildpacks:set heroku/nodejs --app goxperia-staging
heroku buildpacks:add heroku/ruby --app goxperia-staging

### Show Heroku Logs
heroku logs --tail --app goxperia-staging

### Turn maintenance mode on
heroku maintenance:on --app goxperia-production

### Heroku Database Management
https://devcenter.heroku.com/articles/heroku-postgres-backups

Show backups
heroku pg:backups --app goxperia-staging

Create backup
heroku pg:backups:capture --app goxperia-staging

Download a backup
heroku pg:backups:url b001 --app goxperia-staging

Copy staging database to production
heroku pg:copy goxperia-staging::DATABASE DATABASE --app goxperia-production

Schedule DB backups
heroku pg:backups:schedule DATABASE_URL --at '02:00 America/Chicago' --app goxperia-production


heroku certs:auto:enable --app goxperia-production
heroku certs:auto --app goxperia-production