# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'customers.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  u = User.new
  u.name = row['name']
  u.address = row['address']
  u.phone = row['phone']
  u.email = row['email']
  u.balance = row['balance']
  u.save
end


note1 = Note.new
note1.title = 'first note'
note1.body = 'bla bla bla'
note1.save!

note2 = Note.new
note2.title = 'second note'
note2.body = 'bla bla bla'
note2.save!
