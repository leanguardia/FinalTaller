# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


	test_user = User.new
	test_user.name = 'Usuario'	
	test_user.lastname = 'De Prueba'
	test_user.email = 'user@gmail.com'
	test_user.password = 'usertest'
	test_user.sex = 'Male'
	test_user.weight = '70.5'
	test_user.height = '1.70'
	test_user.birthdate = '10/10/1991'
	test_user.rol = 'Client'
	test_user.active = true
	test_user.save!