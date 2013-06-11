class Retailer < ActiveRecord::Base
  attr_accessible :name, :description

#  has_many :audits
	has_many :audits
	has_many :gtins, :through => :audits

end
