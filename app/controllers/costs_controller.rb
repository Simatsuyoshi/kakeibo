class CostsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
      @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
      @orders = current_user.costs.where(date: @month.all_month).order(date: :DESC)
      
      @variable_ratio = Category.joins(:costs).select('categories.*, costs.*')
      @variable_ratio = @orders.left_joins(:category).select('costs.*,categories.name')
     
  end


  def new
    @cost = current_user.costs.build
  end

  def create
    @cost = current_user.costs.build(cost_params)
    
    if @cost.save
      flash[:success] = '追加しました'
      redirect_to '/'
    else
      flash[:danger] = '追加できませんでした'
      render :new
    end
  end

  def edit
    @cost = Cost.find(params[:id])
  end

  def update
    @cost = Cost.find(params[:id])
    
    if @cost.update(cost_params)
      flash[:success] = '更新されました'
      redirect_to '/costs'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy

    flash[:success] = '削除されました'
    redirect_to '/costs'
  end
  
  def month
    @orders = current_user.costs
    @month_group = @orders.select(:date,:cost).group('extract(year from date)').group('extract(month from date)').all.order("date DESC")
    @month_costs = @month_group.where(kind_id:'1').sum(:cost)
    
  end
 
  
  private
  
  def cost_params
    params.require(:cost).permit(:date, :content, :cost, :user_id, :category_id, :kind_id)
  end
end
