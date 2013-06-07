class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :audit

      t.timestamps
    end
    add_index :images, :audit_id
  end
end
