class CreateFamilyTypes < ActiveRecord::Migration
	def change
		create_table :family_types do |t|

			t.string 	:name
			t.integer 	:hours_required
			t.string	:description
			t.timestamps
		end
	end
end
