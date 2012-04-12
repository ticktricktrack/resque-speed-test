## Resque Speed Test

Resque Tasks work fine in specs, but are terribly slow in Production. According to the [FAQ](https://github.com/defunkt/resque/wiki/FAQ) you should ensure that ActiveRecord classes are preloaded, not just lazy loaded.

## Run Example App
This app has two resque jobs in app/workers. The first takes a category_id and enqueues one job for each product.

The second task retrieves the product and outputs its name


```bash
git clone git@github.com:ticktricktrack/resque-speed-test.git
# delete the .rvmrc if you want
bundle install

#mysql
rake db:create && rake db:migrate && rake db:seed

# look at the resque server if you like
# http://localhost:3000/resque/overview
RAILS_ENV=production rails s

# start the worker
RAILS_ENV=production QUEUE=* rake resque:work

# fire a job and watch the output in the worker bash
RAILS_ENV=production rails c
```

```ruby
c = Category.last #100 items
# c = Category.first #1000 items
c.start
```

## Tags

Switch between differences using the tags
don't forget to restart the worker

```bash
git checkout slow
git checkout broken
git checkout fast
git checkout faster
```

### Slow

```ruby
# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do

  end
end
```

### Broken

```ruby
# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do
    ActiveRecord::Base.descendants.each { |klass|  klass.columns }
  end
end
```

### Fast

```ruby
# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do
    Product.columns
  end
end
```

### Faster

```ruby
# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do
    Product.first
  end
end
```