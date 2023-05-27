class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name, null: false
      t.text :explanation
      t.string :shop
      t.integer "user_id"
    end
  end
end
