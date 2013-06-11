class AddGtinIdToAudits < ActiveRecord::Migration
  def change
    add_column :audits, :gtin_id, :integer
  end
end
