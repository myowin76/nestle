class Retailer < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :audits
end
