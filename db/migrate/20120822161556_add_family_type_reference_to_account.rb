class AddFamilyTypeReferenceToAccount < ActiveRecord::Migration
  def change
  	add_column	:accounts, :family_type_id, :integer
  end
end
