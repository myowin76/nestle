class Product < ActiveRecord::Base
  attr_accessible :code, :name, :description, :product_id
end
