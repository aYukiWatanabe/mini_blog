class CommentsController < ApplicationController

  # POST /blogs/:blog_id/comments
  def create
    blog = Blog.find(params[:blog_id])
    blog.comments.create!(params[:comment])
    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  # GET /blogs/:blog_id/comments/:id/edit
  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    render 'blogs/show'
  end

  # PUT /blogs/:blog_id/comments/:id
  def update
    blog = Blog.find(params[:blog_id])
    comment = blog.comments.find(params[:id])
    comment.update_attributes!(params[:comment])
    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  # DELETE /blogs/:blog_id/comments/:id
  def destroy
    blog = Blog.find(params[:blog_id])
    comment = blog.comments.find(params[:id])
    comment.destroy
    redirect_to blog_path(blog)
  end
end
