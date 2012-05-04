class CreateWorkers < ActiveRecord::Migration
  def change
    create_table 	:workers do |t|
      t.string 		:name
      t.string 		:email
      t.integer		:account_id
      t.timestamps
    end

    add_index :workers, [:account_id, :created_at]

  end
end
