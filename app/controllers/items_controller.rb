class ItemsController < ApplicationController

  # ------- Before filters -------- #
  before_action :category, only: [:index]

  def index
    @items = @sub_category.items.page(params[:page])
  end

  def show
    @item = Item.where(id: params[:id]).take
  end

  private
  def category
    @sub_category = Category.where(name: params[:cat]).take
  end
end
