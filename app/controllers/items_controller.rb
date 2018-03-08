class ItemsController < ApplicationController

  # ------- Before filters -------- #
  before_action :category, only: [:index]

  def index
    @items = @sub_category.items.page(params[:page])
  end

  def show
  end

  private
  def category
    @sub_category = Category.where(name: params[:cat]).take
  end
end
