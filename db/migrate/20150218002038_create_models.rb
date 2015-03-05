class CreateModels < ActiveRecord::Migration
  def up
    create_table :models do |t|
      t.string :title
      t.string :name
      t.string :location
      t.integer :position
      t.text :review

      t.timestamps null: false
    end
  end

  def down
    drop_table :models
  end
end
