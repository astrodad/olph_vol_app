class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity
      t.string :description
      t.boolean :priority
      t.string :chair

      t.timestamps
    end
  end
end
