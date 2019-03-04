web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -c 5 -r ./app.rb
redis: redis-server ./config/redis.conf
