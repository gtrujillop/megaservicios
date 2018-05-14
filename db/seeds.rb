# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Type.create([{ name: 'Nevera' }, { name: 'Lavadora' }, { name: 'Microondas' }, { name: 'Plancha' }, { name: 'Audio y TV' }, { name: 'Calentador' }, { name: 'Licuadora' }, { name: 'Otro' }])
Brand.create([{ name: 'Haceb' }, { name: 'General Electric' }, { name: 'Samsung' }, { name: 'Centrales' }, { name: 'LG' }, { name: 'Whirpool' }, { name: 'Mabe' }, { name: 'Otra' }])
User.create(first_name: 'David A.', last_name: 'López', email: 'davidlopez67@hotmail.com', phone: '0573043549496', birth_date: '1980-01-01', password: '12345678', password_confirmation: '12345678', address: 'Rodeo Alto')
u = User.where(email: 'davidlopez67@hotmail.com').first
UserRole.create!(name: 'Administrator', user: u, description: 'Administrator User')