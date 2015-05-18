# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # GoalType.create([{typename: "Steps taken", unit_measured: "Steps"},{typename: "Calories burned", unit_measured: "Calories"},{typename: "Distance covered", unit_measured: "km"},{typename: "Weight decrease", unit_measured: "kg"}])
  GoalType.create([{typename: "Steps taken", unit_measured: "Steps"},{typename: "Calories burned", unit_measured: "Calories"},{typename: "Sleep", unit_measured: "Hours"}])
  GoalType.create([{typename: "Distance covered", unit_measured: "km"},{typename: "Weight decrease", unit_measured: "kg"},{typename: "Weight increase", unit_measured: "kg"}])

	test_user = User.new
	test_user.name = 'Usuario'	
	test_user.lastname = 'De Prueba'
	test_user.email = 'user@gmail.com'
	test_user.password = '12345678'
	test_user.sex = 'Male'
	test_user.weight = '70.5'
	test_user.height = '1.70'
	test_user.birthdate = '10/10/1991'
	test_user.role = 'Client'
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


#Users to test goal creations
#Age tests---------------------------------------------------------------
# test_user = User.new
# test_user.name = 'Young'
# test_user.lastname = 'Female'
# test_user.email = 'yf@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Female'
# test_user.weight = '75.5'
# test_user.height = '1.60'
# test_user.birthdate = '10/10/1991'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Old'
# test_user.lastname = 'Female'
# test_user.email = 'of@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Female'
# test_user.weight = '76.5'
# test_user.height = '1.65'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Young'
# test_user.lastname = 'Male'
# test_user.email = 'ym@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Male'
# test_user.weight = '77.5'
# test_user.height = '1.75'
# test_user.birthdate = '11/10/1991'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Old'
# test_user.lastname = 'Male'
# test_user.email = 'om@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Male'
# test_user.weight = '77.5'
# test_user.height = '1.75'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# #Weight and height tests --------------------------------------------
# test_user = User.new
# test_user.name = 'Heavy'
# test_user.lastname = 'Female'
# test_user.email = 'hv@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Female'
# test_user.weight = '105.5'
# test_user.height = '1.60'
# test_user.birthdate = '10/10/1991'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Average'
# test_user.lastname = 'Female'
# test_user.email = 'af@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Female'
# test_user.weight = '50.5'
# test_user.height = '1.65'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Light'
# test_user.lastname = 'Female'
# test_user.email = 'lf@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Female'
# test_user.weight = '40.5'
# test_user.height = '1.65'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Heavy'
# test_user.lastname = 'Male'
# test_user.email = 'hm@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Male'
# test_user.weight = '157.5'
# test_user.height = '1.75'
# test_user.birthdate = '11/10/1991'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Average'
# test_user.lastname = 'Male'
# test_user.email = 'am@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Male'
# test_user.weight = '50.5'
# test_user.height = '1.75'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
#
# test_user = User.new
# test_user.name = 'Light'
# test_user.lastname = 'Male'
# test_user.email = 'lm@gmail.com'
# test_user.password = '12345678'
# test_user.sex = 'Male'
# test_user.weight = '50.5'
# test_user.height = '1.75'
# test_user.birthdate = '11/10/1951'
# test_user.role = 'Client'
# test_user.active = true
# test_user.save!
