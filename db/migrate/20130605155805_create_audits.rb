class CreateAudits < ActiveRecord::Migration
  def self.up
    create_table :audits do |t|
      t.string :gtin
      t.references :retailer
      t.timestamps
    end

    # Audit.create(gtin: "", retailer_id: "")


  end

  def self.down
    drop_table :audits
  end
end
