class AddImageColumnsToModels < ActiveRecord::Migration
  def self.up
  	add_attachment :models, :image 
  end

  def self.down
  	remove_attachment :models, :image
  end
end
