# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"
require "byebug"
require "nokogiri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
html = open(url).read
ingredients = JSON.parse(html)

ingredients["drinks"].each { |hash| Ingredient.create(name: hash["strIngredient1"]) }

scientist_url = "https://www.famousscientists.org/list/"
scientist_html = open(url).read
scientist_doc = Nokogiri::HTML(scientist_html)

12.times do
  drink = Cocktail.new(name: Faker::Science.scientist)
  until drink.save
    drink = Cocktail.new(name: Faker::Science.scientist)
  end
  img_file = URI.open('https://source.unsplash.com/800x600/?cocktail')
  drink.photo.attach(io: img_file, filename: "drink#{(rand*1000).floor}.png", content_type: 'image/png')
  ingredients = Ingredient.all.to_a
  rand(2..5).times do
    ingredient = ingredients.sample(1)[0]
    Dose.create({ cocktail: drink, ingredient: ingredient, description: "#{rand(1..8)} part(s)" })
    ingredients.delete_at(ingredients.index(ingredient))
  end
end