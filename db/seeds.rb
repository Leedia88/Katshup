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
Category.destroy_all

User.create(email: "admin@thp.com", password: "adminadmin", is_admin: true)
### Generate 10 categories
Category.create(name:'chaton')
Category.create(name:'joie')
Category.create(name:'amour')
Category.create(name:'dodo')
Category.create(name:'grincheux')
Category.create(name:'drole')
Category.create(name:'colere')
Category.create(name:'triste')
Category.create(name:'neutre')
Category.create(name:'autre')


### Generate 10 users
10.times do
  name = Faker::Name.first_name
  User.create!(first_name: name,
    email: "#{name}#{rand(1..9)}@mail.com",
    password: 'password')
end

### Generate 20 products

images = ["http://4.bp.blogspot.com/-XBJp427kEGM/T9xVSnnUFSI/AAAAAAAAAF8/Nvh7FaWQpUw/s1600/Siamese+Kittens.jpg",
      "https://www.vets4pets.com/siteassets/species/cat/cat-sunset.jpg?w=585&amp;scale=down",
    "https://amolife.com/image/Pictures_of_Cute_Cats_2.jpeg",
  "https://amolife.com/image/Pictures_of_Cute_Cats_6.jpg",
"http://c3.thejournal.ie/media/2018/01/grumpy-cat-5-390x285.jpg",
"https://www.somepets.com/wp-content/uploads/2013/05/funny-cat-photos-that-were-perfectly-timed-9.jpg",
"https://www.somepets.com/wp-content/uploads/2013/05/funny-cat-photos-that-were-perfectly-timed-10.jpg",
"https://petsnurturing.com/wp-content/uploads/2018/08/Spotted-cat-breeds-2.jpg",
"https://pulpbits.net/wp-content/uploads/2014/01/Tabby-Cat-Images-728x988.jpg",
"https://www.debilder.net/wp-content/uploads/2018/12/Super-Funny-Cat-Pictures-Bilder.jpg",
"https://www.somepets.com/wp-content/uploads/2014/07/Jumping-cats19.jpg",
"https://www.somepets.com/wp-content/uploads/2014/07/Jumping-cats23.jpg",
"https://www.somepets.com/wp-content/uploads/2014/07/Jumping-cats13.jpeg",
"https://cdn.fstoppers.com/styles/full/s3/media/2017/04/13/cat-ugly.jpg",
"https://540934-1733880-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2019/04/oncilla-AdobeStock_128887437-1024x683.jpg",
"https://540934-1733880-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2020/05/Rusty-spotted-cat-AdobeStock_188804492-1024x683.jpg",
"https://a-z-animals.com/media/2021/04/Smallest-Cats_-Oncilla-1024x535.jpg"
]
20.times do
  Product.create(title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph,
    price: rand(1..1000),
    category: Category.all.sample,
  image_url: images.sample)
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
  rand(1..5).times do
    ProductOrder.create(order:order,product: Product.all.sample)
  end
  total_amount = 0
  order.products.each do |product|
    total_amount += product.price
  end
  order.update(total_amount: total_amount)
end