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
    @item = Item.where(text: params[:text])

    msg = { item: @item }
    render json: msg
  end

  def index
    @items = Item.all
    msg = { items: @items }
    render json: msg
  end

  def checkout
    @item = Item.find_by(text: params[:text])
    @item.done = true
    @item.save
  end

  def destroy
    if Item.where(params[:text] == :text).destroy_all
      msg = { status: '200' }
      render :json => msg
    else
      msg = { status: '500' }
      render json: msg
    end
  end

  private
    def item_params
      params.require(:item).permit(:text, :done)
    end 
end
