class Audit < ActiveRecord::Base
  attr_accessible :gtin, :retailer_id, :gtin_id

  belongs_to :retailer
  belongs_to :gtin
  has_many :retailer_fields
  has_many :images
  # has_attached_file :image

  # set_table_name :audits
  # set_primary_key :gtin



end
