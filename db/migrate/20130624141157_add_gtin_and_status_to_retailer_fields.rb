class AddGtinAndStatusToRetailerFields < ActiveRecord::Migration
  def change
    add_column :retailer_fields, :gtin, :string
    add_column :retailer_fields, :status, :string
  end
end
