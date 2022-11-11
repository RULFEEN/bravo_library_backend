class Readers < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.string :image_url, null: false
    end
  end
end
