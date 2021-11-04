# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cheese.destroy_all
Sneaker.destroy_all

puts "Creating Cheeses 🧀..."
Cheese.create!(name: 'Cheddar', price: 3, is_best_seller: true)
Cheese.create!(name: 'Pepper Jack', price: 4, is_best_seller: true)
Cheese.create!(name: 'Limburger', price: 8, is_best_seller: false) 

puts "Creating Sneakers 👟..."
Sneaker.create!(name: 'Nike Air Zoom Alphafly NEXT% Flyknit', brand: 'NIKE', price: 275, description: 'To reach your next personal best, gear up in this road running shoe that’s made to move fast. It gives you the greatest energy return of all our racing shoes with a propulsive feel through the finish line. The design is light, breathable and backed by data to help keep you comfortable.', my_type: true)

Sneaker.create!(name: 'Court Rider', brand: 'PUMA', price: 100, description: 'Full-coverage rubber outsole with high-abrasion rubber for enhanced durability and traction. Full-length Rider foam in midsole. Lacing system around forefoot runs from lateral midfoot to medial forefoot. Low boot.', my_type: false)
Sneaker.create!(name: 'Chuck Taylor All Star', brand: 'CONVERSE', price: 60, description: 'Canvas upper is lightweight and durable. The timeless silhouette you know and love. High profile for classic coverage. Medial eyelets enhance airflow. Classic All Star ankle patch.', my_type: true)

puts "Done seeding..."