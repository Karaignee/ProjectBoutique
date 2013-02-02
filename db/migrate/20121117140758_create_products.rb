class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :image_url
      t.string :designer
      t.string :category
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
