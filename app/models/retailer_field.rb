class RetailerField < ActiveRecord::Base
  belongs_to :audit
  attr_accessible :content, :field_name
end
