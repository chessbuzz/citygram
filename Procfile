web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -c 5 -r ./app.rb
redis: redis-server ./config/redis.conf
