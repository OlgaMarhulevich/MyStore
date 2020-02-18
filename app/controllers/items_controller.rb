class ItemsController < ApplicationController

    before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
    before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

    def cart
    end

    def home
    end

    def index
    #  @items = Item.all.order("votes_count")
    @items = Item.all
    @items = @items.where("created_at >= ?", 1.day.ago) if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
    @items = @items.order("votes_count DESC")
    end

    def find
      render plain: params[:price_from].inspect
      #@items = Item.where("price >= ?", params[:price_from])
      #render 'index'
    end

    def show
      # #для exception_notification.rb (initializers) not works!# raise "exception test!"
      #@item = Item.find(params[:id])
    end

    def new
      @item = Item.new
    end

    def edit
      #@item = Item.find(params[:id])
    end

    def create
      #render plain: params[:id].inspect
      @item = Item.new(item_params)
      if (@item.save)
        redirect_to @item
      else
        render 'new'
      end
    end

    def update
      #@item = Item.find(params[:id])
      if (@item.update(item_params))
        # not work!! flash[:success] = "Item successfully updated!"
        redirect_to @item
      else
        # not work!! flash.now[:error] = "You made mistakes in your form! Please correct them."
        render 'edit'
      end
    end

    def destroy
      #@item = Item.find(params[:id])
      @item.destroy
      redirect_to items_path
    end

    def upvote
      @item.increment!(:votes_count)
      redirect_to items_path
    end

    def add_item

    end

    private def find_item
      #@item = Item.find(params[:id])
      @item = Item.where(id: params[:id]).first
      render_404 unless @item
    end

    private def item_params
      params.require(:item).permit(:name, :price, :description, :weight)
    end

    def expensive
        @items = Item.where("price > 1000")
        render 'index'
    end

    def cheap
        @items = Item.where("price <= 1000")
        render 'index'
    end

end
