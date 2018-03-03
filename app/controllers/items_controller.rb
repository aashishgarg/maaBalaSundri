class ItemsController < ApplicationController

  # ------- Before filters -------- #
  before_action :category, only: [:index]

  def index
    @items = Item.page(params[:page])
  end

  def show
  end

  private
  def category
    @sub_category = Category.where(name: params[:scat]).take
    @category = Category.where(id: @sub_category.parent_id).take
  end
end
