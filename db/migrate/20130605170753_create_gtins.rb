class CreateGtins < ActiveRecord::Migration
  def self.up
    create_table :gtins do |t|
      t.references :product
      t.string :gtin
      t.string :version
      t.timestamps
    end
  end

  def self.down
    drop_table :gtins
  end
end
