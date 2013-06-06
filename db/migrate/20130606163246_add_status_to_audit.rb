class AddStatusToAudit < ActiveRecord::Migration
  def change
    add_column :audits, :status_id, :integer
  end
end
