class CreateWorkersAccountTable < ActiveRecord::Migration


	def self.up
	
		create_table :activity_workers do |t|
			t.references :activity, null: false
			t.references :worker, null: false
		end

		

	end

end
