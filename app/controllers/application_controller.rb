class ApplicationController < ActionController::Base
  protect_from_forgery

  def clone_with_errors(object)
    clone = object.clone
    object.errors.each{|field,msg| clone.errors.add_to_base(msg)}
    return clone
  end

  
end
