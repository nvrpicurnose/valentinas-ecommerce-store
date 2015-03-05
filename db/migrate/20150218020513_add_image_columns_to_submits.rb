class AddImageColumnsToSubmits < ActiveRecord::Migration
  def self.up
  	add_attachment :submits, :image 
  end

  def self.down
  	remove_attachment :submits, :image
  end
end
