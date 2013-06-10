class Gtin < ActiveRecord::Base
  attr_accessible :product_id, :gtin, :version, :description
  set_primary_key :gtin
  has_many :audits, :class_name => Audit, :foreign_key => :gtin
end
