# This code was run as a seed when we first added family types. It should
# not be run again.


#family_types = FamilyType.create([
#	{name: "Two parent", hours_required: 30}, 
#	{name: "Singe parent", hours_required: 15}, 
#	{name: "Deployed parent", hours_required: 15}, 
#	{name: "Disabled parent", hours_required: 15},
#	{name: "Other", hours_required: 15}
#
#	])


#default_family_type = FamilyType.first
#Account.all.each do |account| #
#	account.family_type = default_family_type
#	account.save!
#end

#VolunteerEvent.all.each do |event|
#	event.hours_worked = event.hours_worked * 3600 #Convert hours into seconds
#	event.save!
# end

Activity.all.each do |activity|
	desc = Description.new(name: activity.activity)
	desc.save!
end



