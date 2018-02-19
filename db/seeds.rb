# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clear the DB on Heroku in Terminal
# `heroku pg:reset DATABASE`

# Clear the DB locally
# Rake::Task['db:reset'].invoke

# Delete each table in the opposite sequence from migration
OrderItem.delete_all
Meal.delete_all
DeliveryOrder.delete_all

# Create 10 meals
[
  'Big Mac Extra Value Meal',
  'Chicken McNuggets Extra Value Meal',
  'McSpicy Extra Value Meal',
  'McWings Extra Value Meal',
  'Grilled Chicken McWrap Extra Value Meal',
  'Filet-O-Fish Extra Value Meal',
  'McChicken Extra Value Meal',
  'Cheeseburger Extra Value Meal',
  'Veggie Crunch Burger Extra Value Meal',
  'Grilled Chicken Sandwich Extra Value Meal'
].each do |meal|
  Meal.create(
    name: meal,
    description: 'Everything is awesome!'
  )
end

# Creates 5 delivery orders that contains any number of order items ranging from 1 to 5
5.times do
  @order = DeliveryOrder.create()
  Random.rand(1..5).times do
    OrderItem.create(
      delivery_order_id: @order.id,
      meal_id: Meal.all.sample.id,
      quantity: Random.rand(1..50),
      unit_price: Random.rand(500..1000)
    )
  end
end
