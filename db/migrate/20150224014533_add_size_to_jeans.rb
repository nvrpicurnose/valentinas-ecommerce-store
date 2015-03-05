class AddSizeToJeans < ActiveRecord::Migration
  def up
  	add_column :jeans, :size, :string
  end

  def down
  	remove_column :jeans, :size
  end
end
