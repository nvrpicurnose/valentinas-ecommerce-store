class Submit < ActiveRecord::Base
	has_attached_file :image, :styles => {:medium=>"300*300>", :thumb=> "100x100>"}, :default_url => "/images/:style/missing.png"

	validates_presence_of :title
	validates_presence_of :name
	validates_presence_of :review
	validates_presence_of :location
	validates_presence_of :image
	validates_presence_of :email
	validates :agree, acceptance: {accept: true}

	validates_attachment_content_type	:image, :content_type=> /\Aimage\/.*\Z/

end
