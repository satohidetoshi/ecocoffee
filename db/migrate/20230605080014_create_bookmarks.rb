class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
        # bookmarksテーブルに置いてuser_idとitem_idの組み合わせを一意性のあるものしている。
    add_index  :bookmarks, [:user_id, :item_id], unique: true
  end
end
