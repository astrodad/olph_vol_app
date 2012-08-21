class Activity < ActiveRecord::Base
 	attr_accessible :activity, :chair, :description, :priority, :interest
 	validates :activity, presence: true, length: {maximum: 50}
	has_and_belongs_to_many :workers 

 	default_scope order: 'priority DESC, activity ASC'

end
