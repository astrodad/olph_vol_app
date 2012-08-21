class AddContactInfoToWorker < ActiveRecord::Migration
  def change
  	add_column	:workers, :relationship, :string
  	add_column	:workers, :phone, :string
  	add_column	:workers, :occupation, :string
  end
end
