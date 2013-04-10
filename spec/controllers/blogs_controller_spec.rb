require 'spec_helper'

describe BlogsController do
  describe '#create' do
    it 'should fail' do
      expect {
        post :create, blog: { title: '' }
      }.not_to change { Blog.count }
      response.status.should == 400
    end
  end

  describe '#update' do
    before { @blog = Blog.create!(title: 'title') }

    it 'should fail' do
      expect {
        post :update, id: @blog.id, blog: { title: '' }
      }.not_to change { @blog.reload.title }
      response.status.should == 400
    end
  end

  describe '#destroy' do
    before { @blog = Blog.create!(title: 'title') }

    it 'should destroy' do
      expect {
        delete :destroy, id: @blog.id
      }.to change { Blog.count }.by(-1)
    end
  end
end
