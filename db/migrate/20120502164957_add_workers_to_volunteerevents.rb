class AddWorkersToVolunteerevents < ActiveRecord::Migration
  def change
  	add_column	:volunteer_events, :worker_id, :integer
  	
  end
end
