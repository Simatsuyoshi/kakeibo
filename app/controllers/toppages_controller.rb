class ToppagesController < ApplicationController
  def index
    if logged_in?
      
      @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
      @orders = current_user.costs.where(date: @month.all_month)
      @costs = @orders.where(kind_id:'1')
      @incomes = @orders.where(kind_id:'2')
      @kinds = @incomes.sum(:cost) - @costs.sum(:cost)
     
      @variable_ratio = @costs.joins(:category).group("categories.name").sum(:cost).sort_by { |_, v| v }.reverse.to_h
      @categories_id = @costs.joins(:category).group("categories.id").group("categories.name").sum(:cost).sort_by { |_, v| v }.reverse.to_h
      
      @variable_ratio.each do |k,v| 
        ratio = (v * 100).to_f / @costs.sum(:cost)
        @variable_ratio[k] = ratio.round(1)
      @categories = @costs.joins(:category).group("categories.name").sum(:cost)  
      end
    end
  end
end
