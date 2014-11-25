# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Company.delete_all
puts "All Companies cleared"
Contact.delete_all
puts "All Contacts clearded"

company = Company.create(name: "My Big Company", size: 10, year: 2000, industry: "internet", revenue: 2000000)
contact = Contact.create(name: "Dave Brown", email: "dave.brown@mybigcompany.com", phone: "4085551212", company: company)
