class AddStandExpirationToWorker < ActiveRecord::Migration
def change
  	add_column	:workers, :stand_expiration_date, :date
  end
end
