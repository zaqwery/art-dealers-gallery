# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'CREATING ROLES'                                                                        e
Role.create([
                { :name => 'admin' },
                { :name => 'visitor' },
                { :name => 'manager' }
            ], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'ILLIA OVSIIKO', :email => 'zaqwery@gmail.com', :password => 'd2ebf0', :password_confirmation => 'd2ebf0'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'LILIIA OVSIIKO', :email => 'lavenite@gmail.com', :password => '1q2w3e4r5t', :password_confirmation => '1q2w3e4r5t'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :manager