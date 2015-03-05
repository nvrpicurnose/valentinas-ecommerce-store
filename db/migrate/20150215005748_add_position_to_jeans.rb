class AddPositionToJeans < ActiveRecord::Migration
  def up
    add_column :jeans, :position, :integer
  end

  def down
  	remove_column :jeans, :position
  end
end
