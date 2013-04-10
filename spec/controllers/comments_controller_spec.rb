require 'spec_helper'

describe CommentsController do
  before { @blog = Blog.create!(title: 'title') }

  describe '#create' do
    it 'should fail' do
      expect {
        post :create, blog_id: @blog.id, comment: { body: '' }
      }.not_to change { @blog.comments.count }
      response.status.should == 400
    end
  end

  describe '#update' do
    before { @comment = @blog.comments.create!(body: 'body') }
    it 'should fail' do
      expect {
        post :update, blog_id: @blog.id, id: @comment.id, comment: { body: '' }
      }.not_to change { @comment.reload.updated_at }
      response.status.should == 400
    end
  end

  describe '#destroy' do
    before { @comment = @blog.comments.create!(body: 'body') }

    it 'should destroy' do
      expect {
        delete :destroy, blog_id: @blog.id, id: @comment.id
      }.to change { @blog.comments.count }.by(-1)
      Comment.where(id: @comment.id).should have(0).items
    end
  end
end
