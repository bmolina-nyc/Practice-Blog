# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {name: 'Bruce', password: "test", password_confirmation: "test"},
  {name: 'Arlette', password: "test", password_confirmation: "test"}
  ])

posts = Post.create([
  {name:"Post 1", content: "etwas fadsjnlasf fdsanskl fdasfsd fdank", user_id: 1},
  {name:"Post 2", content: "etwas fadsjfdadsnlasf fdafads fdsanskl fdf fdasf fdafdads asfsd fdahfshshhsnk", user_id: 1},
  {name:"Post 3", content: "ethfshdswas ffdafasdadsjnlasf fdsaffdsanskldfasdf fdasfsd fdafhsdfnk", user_id: 1},
  {name:"Post 4", content: "ethfsdhfwas fadsjnldfasasfhgdfhgdf fdsanskl fdasfsd fdank", user_id: 2},
  {name:"Post 5", content: "etwfhsdhdas fadsjnlasf fdsanskl gfshfhffdasfsd fdank", user_id: 2},
  {name:"Post 6", content: "ethfsdhhwas fhfsdhadsjnlasf fdssdfhsdhfsdfhanskl fdasfshfshfdd fdank", user_id: 2}
])


