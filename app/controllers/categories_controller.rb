class CategoriesController < ApplicationController
  before_action :require_user_logged_in
  def show
   @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
   @orders = current_user.costs.where(date: @month.all_month).order(date: :DESC)  
   #@categories = @orders.costs.find(params[:category_id])
   @category_content = @orders.group('category_id').sum(:cost).sort_by { |_, v| _ }.reverse.to_h
   @category = @orders.where(category_id: params[:id])
   @category_name = Category.find(params[:id])
  end
end
