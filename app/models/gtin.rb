class Gtin < ActiveRecord::Base
  attr_accessible :product_id, :gtin, :version, :description
  # set_primary_key :gtin
  # self.primary_key = 'gtin'

  has_many :audits	#, :class_name => Audit, :foreign_key => :gtin
  has_many :retailers, :through => :audits

  # validates :audit, :presence => true
end
