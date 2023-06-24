class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items
    @item_new = Item.new
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @bookmark_list = Item.find(bookmarks)
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])

  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


    private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to items_path
    end
  end

end
