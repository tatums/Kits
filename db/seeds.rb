# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
10.times do |i|
  Product.create(:title => "Product #{i+1}", :description => "Product #{i+1}")
end

Kit.delete_all
10.times do |i|
  Kit.create(:title => "Kit #{i+1}")
end
