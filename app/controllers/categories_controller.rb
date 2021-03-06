class CategoriesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:create]

  def posts_by_categories
    @category = Category.find_by_name(params[:name])
    @posts = @category.posts.published.paginate(:page => params[:page])
    @categories = Category.all
    render "posts/index"
  end

  def create
    @category = Category.new(params[:category])
    flash[:alert] = 'Fail!' unless @category.save
    redirect_to(dashboard_path)
    render :layout => 'admin'
  end
 
end
