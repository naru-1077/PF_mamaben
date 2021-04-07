class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_image_id
      t.text :recipe
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
