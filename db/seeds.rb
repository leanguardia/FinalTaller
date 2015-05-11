# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  GoalType.create([{typename: "Steps taken", unit_measured: "Steps"},{typename: "Calories burned", unit_measured: "Calories"},{typename: "Distance covered", unit_measured: "km"},{typename: "Weight decrease", unit_measured: "kg"}])

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

	test_user = User.new
	test_user.name = 'Usuario1'	
	test_user.lastname = 'De Prueba'
	test_user.email = 'user1@gmail.com'
	test_user.password = 'usertest1'
	test_user.sex = 'Male'
	test_user.weight = '75.5'
	test_user.height = '1.60'
	test_user.birthdate = '10/10/1991'
	test_user.rol = 'Client'
	test_user.active = true
	test_user.save!

	test_user = User.new
	test_user.name = 'Usuario2'	
	test_user.lastname = 'De Prueba'
	test_user.email = 'user2@gmail.com'
	test_user.password = 'usertest2'
	test_user.sex = 'Male'
	test_user.weight = '76.5'
	test_user.height = '1.65'
	test_user.birthdate = '11/10/1991'
	test_user.rol = 'Client'
	test_user.active = true
	test_user.save!

	test_user = User.new
	test_user.name = 'Usuario3'	
	test_user.lastname = 'De Prueba'
	test_user.email = 'user3@gmail.com'
	test_user.password = 'usertest3'
	test_user.sex = 'Male'
	test_user.weight = '77.5'
	test_user.height = '1.75'
	test_user.birthdate = '11/10/1991'
	test_user.rol = 'Client'
	test_user.active = true
	test_user.save!

	test_band = Band.new
	test_band.color = 'blue'
    test_band.user_id = 1
    test_band.Band_type_id = 1

    test_band = Band.new
	test_band.color = 'blue'
    test_band.user_id = 2
    test_band.Band_type_id = 1

    test_band = Band.new
	test_band.color = 'blue'
    test_band.user_id = 3
    test_band.Band_type_id = 1
