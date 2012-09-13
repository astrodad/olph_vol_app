class Description < ActiveRecord::Base
  attr_accessible :name

  validates	:name, presence: true, length: {maximum: 60}

  default_scope order: 'name ASC'
end
