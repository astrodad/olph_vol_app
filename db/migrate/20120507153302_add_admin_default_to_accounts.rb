class AddAdminDefaultToAccounts < ActiveRecord::Migration
  def change
  	change_column :accounts, :admin, :boolean,  default: false
  end
end
