# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.delete_all
#Recipe.delete_all 
require 'pry'
require 'unirest'
#Recipe.delete_all

response = Unirest.get "https://tasty.p.rapidapi.com/recipes/list?q=deserts&from=0&sizes=10",
headers:{
  "X-RapidAPI-Host" => "tasty.p.rapidapi.com",
  "X-RapidAPI-Key" => "ca036601damsh5819a2bc9ae9cffp14861fjsncd852ab3030f"
}
data = response.body['results']
 #binding.pry

data.each do |x|
    Recipe.create(
        name: x['name'],
        description: x['description'],
        thumb_url: x['thumbnail_url'],
        user_ratings: 0,
        vid_url: x['video_url']
    )
end



