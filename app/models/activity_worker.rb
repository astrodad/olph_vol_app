class ActivityWorker < ActiveRecord::Base

	attr_accessible :worker, :activity, :activity_id

	belongs_to :worker
	belongs_to :activity

end
