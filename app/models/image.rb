class Image < ActiveRecord::Base
  belongs_to :audit
  # attr_accessible :title, :body
end
