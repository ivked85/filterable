ams = City.create(name: 'Amsterdam')
par = City.create(name: 'Paris')
lon = City.create(name: 'London')

User.create(name: 'John', city: lon, eye_color: 'brown')
User.create(name: 'Richard', city: lon, eye_color: 'blue')
User.create(name: 'Jean', city: par, eye_color: 'green')
User.create(name: 'Van', city: ams, eye_color: 'brown')
