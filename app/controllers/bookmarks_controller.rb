class BookmarksController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    if @item.user_id != current_user.id   # 投稿者本人以外に限定
      @bookmark = Bookmark.create!(user_id: current_user.id, item_id: @item.id)
    end
    redirect_to item_path(@item)
  end
  # お気に入り削除
  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, item_id: @item.id)
    @bookmark.destroy
    redirect_to item_path(@item)
  end
  
  def index
    @bookmarks = Bookmark.all
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

end

