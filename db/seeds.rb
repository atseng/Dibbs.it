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
  [ "April O'Neil", 'reporter@nyc.com', 'jumpsuit99', 'jumpsuit99']
  [ "Casey Jones", 'rangers@nyc.com', 'puckupsucker', 'puckupsucker']
  [ "Shredder", 'cowabunga@nyc.com', 'returnoftheshred', 'returnoftheshred']
]

user_list.each do |name, email, password, password_confirmation|
  User.create( name: name, email: email, password: password, password_confirmation: password_confirmation )
end

  raph = User.find_by_name("Raphael")
  mike = User.find_by_name("Michaelango")
  leo = User.find_by_name("Leonardo")
  don = User.find_by_name("Donatello")
  ap = User.find_by_name("April O'Neil")
  cj = User.find_by_name("Casey Jones")
  shredder = User.find_by_name("Shredder")

item_list = [
  [raph, "katana", "Video Games", "samurai sword", " ", 200  ],
  [mike, "nunchucks", "Electronics", "woood handles", " ", 75 ],
  [leo, "sai", "Films", "double sidekicks", " ", 100 ],
  [don, "bo staff", "Outdoors", "high jumper", " ", 150 ]
  [ap, "yellow jumpsuit", "Clothes", "mic'd up", " ", 60]
  [cj, "hockey stick", "Sports", "solid wood oak", " ", 75]
  [shredder, "claw", "Accessories", "slice & dice", " ", 1000]
]

 item_list.each do | user, name, category, description, avatar, value|
   user.items.create(name: name, category: category, description: description, avatar: avatar, value: value)
 end


