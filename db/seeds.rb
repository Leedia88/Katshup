# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CartProduct.destroy_all 
Cart.destroy_all 
ProductOrder.destroy_all 
Order.destroy_all 
User.destroy_all

Product.destroy_all 



### Generate 10 users
10.times do
  name = Faker::Name.first_name
  User.create!(first_name: name,
    email: "#{name}#{rand(1..9)}@mail.com",
    password: 'password')
end

### Generate a cart for each user
User.all.each {|user| Cart.create(user: user)}

### Generate 20 products
20.times do
  Product.create(title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph,
    price: rand(1..1000))
end

### Add 1-5 products to each cart
Cart.all.each do |cart|
  rand(1..5).times do
    CartProduct.create(cart: cart, product: Product.all.sample)
  end
end

### Generate 5 orders
5.times do
  Order.create(user: User.all.sample)
end

### Generate product and order connection
Order.all.each do |order|
  ProductOrder.create(order:order,product: Product.all.sample)
end