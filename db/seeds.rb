# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
  [ "Raphael", 'raph@nyc.com', 'mastersplinter', 'mastersplinter' ],
  [ "Michaelango", 'mikey@ny.com', 'shredder1', 'shredder1' ],
  [ "Leonardo", 'leo@nyc.com', 'apriloneil', 'apriloneil' ],
  [ "Donatello", 'donatello@nyc.com', 'rubyonrails', 'rubyonrails' ]
]

user_list.each do |name, email, password, password_confirmation|
  User.create( name: name, email: email, password: password, password_confirmation: password_confirmation )
end

  raph = User.find_by_name("Raphael")
  mike = User.find_by_name("Michaelango")
  leo = User.find_by_name("Leonardo")
  don = User.find_by_name("Donatello")

item_list = [
  [raph, "katana", "video games", "samurai sword", " ", 200  ],
  [mike, "nunchucks", "electronics", "woood handles", " ", 75 ],
  [leo, "sai", "dvds", "double sidekicks", " ", 100 ],
  [don, "bo staff", "sports & outdoors", "high jumper", " ", 150 ]
]

 item_list.each do | user, name, category, description, avatar, value|
   user.items.create(name: name, category: category, description: description, avatar: avatar, value: value)
 end


