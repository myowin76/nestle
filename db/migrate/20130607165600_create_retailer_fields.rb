class CreateRetailerFields < ActiveRecord::Migration
  def change
    create_table :retailer_fields do |t|
      t.string :field_name
      t.text :content
      t.references :audit

      t.timestamps
    end
    add_index :retailer_fields, :audit_id
  end
end
