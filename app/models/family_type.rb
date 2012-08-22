class FamilyType < ActiveRecord::Base
	attr_accessible :name, :description, :hours_required

	validates 	:name, presence: true, length: {maximum: 20}
	validates 	:hours_required, presence: true, numericality: {only_integer: true, greater_than: 0}
	validates	:description, length: {maximum: 60}

	has_many	:accounts
	
end
