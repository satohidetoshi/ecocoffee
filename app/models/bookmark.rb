class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  
    # user_id と item_idの組み合わせを一意性のあるものにしている
  validates :user_id, uniqueness: { scope: :item_id }
end
