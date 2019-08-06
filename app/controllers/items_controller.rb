class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    if @item.save
      msg = { status: '200' }
      render :json => msg
    else
      msg = { status: '500' }
      render json: msg
    end
  end

  def show
    @items = Item.all
    msg = { item: @items }
    render json: msg
  end

  def update
    @item = Item.find_by(text: params[:text])
    @item.done = true
    @item.save
  end

  def index
    @items = Item.all
    msg = { items: @items }
    render json: msg
  end

  def destroy
    @item = Item.find_by(text: params[:id].to_s)
    @item.destroy
  end

  private
    def item_params
      params.require(:item).permit(:text, :done)
    end 

end
