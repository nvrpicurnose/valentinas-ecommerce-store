class AddAttachmentImageToJeans < ActiveRecord::Migration
  def self.up
    add_attachment :jeans, :image
  end

  def self.down
    remove_attachment :jeans, :image
  end
end
