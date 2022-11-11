class Authors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :genre, default: "programming", null: false
      t.string :image_url

      t.timestamps
    end
  end
end
