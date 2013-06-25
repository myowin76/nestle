class Image < ActiveRecord::Base

	belongs_to :audit
  attr_accessible :title, :body, :image

    has_attached_file :image,
    # :default_url => "/images/default_:style_avatar.png",
  	# :styles => { :large => "640x480", :medium => "300x300>", :small => "100x100>" },
    :styles => { :large => "640x480" },
    :url  => "/images/:id/:style/:basename.:extension",
    :path => 'audits/:basename.:extension',
    :path => ":rails_root/public/audits/:gtin/:styles/:basename.:extension",
    :storage => :filesystem

    validates_attachment_presence :image
  	validates_attachment_content_type :image, 
    #validates_attachment_size :photo, :less_than => 5.megabytes
      :content_type => ['image/jpeg', 'image/pjpeg', 
  								   'image/jpg', 'image/png']

end
