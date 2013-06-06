class Audit < ActiveRecord::Base
  attr_accessible :gtin, :retailer

  belongs_to :retailer
end
