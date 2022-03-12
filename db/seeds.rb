# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = ['食費','日用品','美容','交際費','光熱費','住居費','趣味','衣服','交通費','その他']
categories.each do |category|
 Category.create!(
   name: category
 )
end

kinds = ['支出','収入']
kinds.each do |kind|
 Kind.create!(
   name: kind    
 )
end