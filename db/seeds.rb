# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
platinum = Plan.create(name: 'Platinum Plan (29%) Monthly', value: 'Platinum', rate: 0.29, tenure: 2)
diamond = Plan.create(name: 'Diamond Plan (35%) Monthly', value: 'Diamond' , rate: 0.35, tenure: 2)


admin = User.create(email: "jondoe@fintelvalues.com", first_name: "jon",  last_name: "doe", password: "fintelvalues123", role: "admin")

client = User.create(email: "janedoe@fintelvalues.com", first_name: "jane", last_name: "doe", password: "fintelvalues123",  role: "client")
