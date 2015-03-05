class Jean < ActiveRecord::Base

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	acts_as_list

	validates_presence_of	:title
	validates_presence_of	:price
	validates_presence_of	:description
	validates_presence_of 	:position
	validates_presence_of	:image
	validates_attachment_content_type	:image, :content_type=> /\Aimage\/.*\Z/

	scope :sorted, lambda { order("jeans.position ASC")}
end
