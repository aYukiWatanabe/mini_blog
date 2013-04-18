class CommentsController < ApplicationController

  # POST /blogs/:blog_id/comments
  def create
    raise NotImplementedError

    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  # GET /blogs/:blog_id/comments/:id/edit
  def edit
    @blog    = nil
    @comment = nil
    raise NotImplementedError

    render 'blogs/show'
  end

  # PUT /blogs/:blog_id/comments/:id
  def update
    raise NotImplementedError

    redirect_to blog_path(blog)
  rescue ActiveRecord::RecordInvalid => e
    @comment = e.record
    @blog = @comment.blog
    render 'blogs/show', status: 400
  end

  # DELETE /blogs/:blog_id/comments/:id
  def destroy
    raise NotImplementedError

    redirect_to blog_path(blog)
  end
end
