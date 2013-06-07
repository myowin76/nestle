class AddAttachmentImageToAudits < ActiveRecord::Migration
  def self.up
    change_table :audits do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :audits, :image
  end
end
