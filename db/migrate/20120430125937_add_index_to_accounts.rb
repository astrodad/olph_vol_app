class AddIndexToAccounts < ActiveRecord::Migration
  def change
  	add_column	:accounts, :email, :string
  	add_index :accounts, :email, unique: true
  end
end
