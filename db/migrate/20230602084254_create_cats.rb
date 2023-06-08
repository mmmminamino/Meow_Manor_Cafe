class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      
      t.string :name,              null: false
      t.string :introduction,               null: false
      t.integer :genders, default: 0,               null: false
      t.string :age,               null: false
      t.string :image_id
      t.string :cat_type,               null: false
      t.datetime :remember_created_at
      
      t.timestamps
    end
  end
end
