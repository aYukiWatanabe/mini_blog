class BlogsController < ApplicationController

  # ----- ----- ----- ----- read ----- ----- ----- -----

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find params[:id]
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find params[:id]
  end

  # ----- ----- ----- ----- write ----- ----- ----- -----

  def create
    Blog.create! params[:blog]
    redirect_to action: 'index'
  rescue ActiveRecord::RecordInvalid => e
    @blog = e.record
    render 'new'
  end

  def update
    @blog = Blog.find params[:id]
    @blog.update_attributes! params[:blog]
    redirect_to action: 'show'
  rescue ActiveRecord::RecordInvalid => e
    @blog = e.record
    render 'edit'
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to action: 'index'
  end
end
