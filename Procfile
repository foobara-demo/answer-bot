web: bundle exec rackup config.ru -p $PORT

worker: QUEUE=* bundle exec rake resque:work

scheduler: bundle exec rake resque:scheduler
