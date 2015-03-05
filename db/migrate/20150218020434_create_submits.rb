class CreateSubmits < ActiveRecord::Migration
  def up
    create_table :submits do |t|
      t.string :title
      t.string :name
      t.string :location
      t.string :email
      t.text :review
      t.boolean :agree

      t.timestamps null: false
    end
  end

  def down
    drop_table :submits
  end
end
