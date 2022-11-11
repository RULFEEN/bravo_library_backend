class Books < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.float :price
      t.integer :year
      t.integer :isbn
      t.string :image_url
      
      t.integer :stock, default: 100, null: false

      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
