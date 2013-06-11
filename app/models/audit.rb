class Audit < ActiveRecord::Base
  attr_accessible :gtin, :retailer_id, :gtin_id

  belongs_to :retailer
  belongs_to :gtin
  has_many :retailer_fields
  has_attached_file :image

  # set_table_name :audits
  # set_primary_key :gtin


  # has_attached_file :image,
  #   # :default_url => "/images/default_:style_avatar.png",
  # 	:styles => { :large => "640x480", :medium => "300x300>", :small => "100x100>" },
  #   :url  => "/photos/:id/:style/:basename.:extension",
  #   :path => 'audits/:gtin/:basename.:extension',
  #   # :path => ":rails_root/public/audits/:id/:styles/:basename.:extension",
  #   # :storage => :filesystem,
  #   :storage => :s3,
  #   :s3_credentials => "#{Rails.root}/config/aws.yml",
  #   :s3_permissions => {
  #     :thumbnail => :public_read,
  #     :small => :public_read,
  #     :medium => :public_read,
  #     :large => :public_read,
  #     :original => :public_read
  #   },
  #   :s3_protocol => 'http',
  #     :s3_options => {
  #       :server_side_encryption => 'AES256',
  #       :storage_class => :reduced_redundancy
  #       # :content_disposition => 'attachment'
  #     },
  #   :s3_headers => {"Content-Disposition" => "attachment"},
  #   :bucket => "NestleContentTool"
end
