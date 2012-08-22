# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


family_types = FamilyType.create([
	{name: "Two parent", hours_required: 30}, 
	{name: "Singe parent", hours_required: 15}, 
	{name: "Deployed parent", hours_required: 15}, 
	{name: "Disabled parent", hours_required: 15},
	{name: "Other", hours_required: 15}

	])

default_family_type = FamilyType.first
Account.all.each do |account| 
	account.family_type = default_family_type
	account.save!
end

	

