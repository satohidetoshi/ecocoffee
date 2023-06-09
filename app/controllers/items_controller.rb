class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def index
    @item = Item.new
    @items = Item.all
  end

  def show
     @item = Item.find(params[:id]) 
     @comment = Comment.new
     
  end

  def edit
     @item = Item.find(params[:id]) 
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)  
  end
  
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end
  
  
  
private
  def item_params
    params.require(:item).permit(:name, :explanation, :shop)
  end
end
