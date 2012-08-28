class AddRequirementOverridesToAccount < ActiveRecord::Migration
  def change
  	add_column	:accounts, :hours_override_note, :string
  	add_column	:accounts, :hours_override_amount, :integer
  end
end
