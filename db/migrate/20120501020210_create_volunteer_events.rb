class CreateVolunteerEvents < ActiveRecord::Migration
  def change
    create_table :volunteer_events do |t|
      t.string :name
      t.date :event_date
      t.integer :hours_worked
      t.integer	:eventtype
      t.timestamps
      t.references :worker
    end

    add_index	:volunteer_events, [:eventtype, :created_at]
    
  end
end
