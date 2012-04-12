require 'resque'
Resque.redis = Redis.new(:host => 'localhost', :port => 6379)
Resque.redis.namespace = "resque:test_#{Rails.env}" # separate redis namespace for dev/prod/test environments
