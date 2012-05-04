class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name
      t.integer :multiplier
      t.string :description

      t.timestamps
    end

    

  end
end
