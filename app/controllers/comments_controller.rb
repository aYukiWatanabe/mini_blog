class CommentsController < ApplicationController

  def create
    blog = Blog.find(params[:blog_id])
    blog.comments.create!(params[:comment])
    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show'
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    render 'blogs/show'
  end

  def update
    blog = Blog.find(params[:blog_id])
    comment = blog.comments.find(params[:id])
    comment.update_attributes!(params[:comment])
    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show'
  end

  def destroy
    blog = Blog.find(params[:blog_id])
    comment = blog.comments.find(params[:id])
    comment.destroy
    redirect_to blog_path(blog)
  end
end
