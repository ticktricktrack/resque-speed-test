require 'resque/tasks'
# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do
    ActiveRecord::Base.descendants.each { |klass|  puts klass.first.name }
    Product.columns
    Category.columns
    Product.first
  end
end