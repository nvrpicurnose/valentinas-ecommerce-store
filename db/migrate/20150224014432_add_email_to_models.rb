class AddEmailToModels < ActiveRecord::Migration
  def up
  	add_column :models, :email, :string
  end

  def down
  	remove_column :models, :email
  end
end
