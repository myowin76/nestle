class Audit < ActiveRecord::Base
  attr_accessible :gtin, :retailer_id

  belongs_to :retailer
end
