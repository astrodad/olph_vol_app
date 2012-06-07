class AddStandToWorkers < ActiveRecord::Migration
  def change
  	add_column	:workers, :stand_certified, :boolean, default: false
  end
end
