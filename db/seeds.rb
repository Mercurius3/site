# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pages = Page.create(
  [
    { name: 'Home', content: 'Hello, world', permalink: 'home' },
    { name: 'Contact', content: 'Contact pagina', permalink: 'contact' }
  ]
)
user1 = User.create first_name: 'Axel', last_name: 'Graff', email: 'mercurius3@me.com', password: 'testtest'
