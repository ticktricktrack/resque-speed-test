# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.destroy_all
Product.destroy_all


c = Category.create(:name => "Category 1000")

1000.times do |n|
  c.products.create(:name => "Product #{n}")
end

c2 = Category.create(:name => "Category 100")

100.times do |n|
  c2.products.create(:name => "Product #{n}")
end