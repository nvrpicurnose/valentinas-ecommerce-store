class CreateJeans < ActiveRecord::Migration
  def up
    create_table :jeans do |t|
      t.string :title
      t.integer :price, :scale=>2, :precision=>5
      t.text :description

      t.timestamps null: false
    end
  end

  def down
  	drop_table :jeans
  end
end
