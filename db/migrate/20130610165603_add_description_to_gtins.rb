class AddDescriptionToGtins < ActiveRecord::Migration
  def change
    add_column :gtins, :description, :string
  end
end
