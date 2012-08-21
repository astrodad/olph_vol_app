module FormHelper
  def setup_account(account)
    
    account.workers.each do |worker| 
	    (Activity.all - worker.activities).each do |activity|
	      worker.activity_workers.build(activity: activity)
	    end
	end
    
    
    account
    
  end
end