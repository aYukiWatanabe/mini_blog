class CommentsController < ApplicationController

  def create
    raise NotImplementedError

    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  def edit
    raise NotImplementedError
    @blog    = nil
    @comment = nil

    render 'blogs/show'
  end

  def update
    raise NotImplementedError

    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  def destroy
    raise NotImplementedError

    redirect_to blog_path(blog)
  end
end
