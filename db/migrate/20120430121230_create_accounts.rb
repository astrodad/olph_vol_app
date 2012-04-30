class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :year
      t.boolean :admin

      t.timestamps
    end
  end
end
