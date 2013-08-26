class IncreaseActivitiesDescription < ActiveRecord::Migration
  def up
  	change_column :activities, :description, :text, :limit => nil
  end

  def down
  end

  #Requested by OLPH 2nd VP 2013-08-26 JP

end
