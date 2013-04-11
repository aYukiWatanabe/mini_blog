require 'spec_helper'

describe BlogsController do
  describe '#index' do
    subject { get :index }
    it { should render_template(:index) }
  end

  describe '#show' do
    before { @blog = Blog.create!(title: 'title') }
    subject { get :show, id: @blog.id }
    it { should render_template(:show) }
  end

  describe '#new' do
    subject { get :new }
    it { should render_template(:new) }
  end

  describe '#edit' do
    before { @blog = Blog.create!(title: 'title') }
    subject { get :edit, id: @blog.id }
    it { should render_template(:edit) }
  end

  describe '#create' do
    it 'should create' do
      expect {
        post :create, blog: { title: 'title' }
      }.to change { Blog.count }.by(1)
      response.should redirect_to(action: :index)
    end

    it 'should fail' do
      expect {
        post :create, blog: { title: '' }
      }.not_to change { Blog.count }
      response.status.should == 400
    end
  end

  describe '#update' do
    before { @blog = Blog.create!(title: 'title') }

    it 'should update' do
      expect {
        post :update, id: @blog.id, blog: { title: 'new-title' }
      }.to change { @blog.reload.title }.from('title').to('new-title')
      response.should redirect_to(blog_url(assigns(:blog)))
    end

    it 'should fail, if title is blank' do
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
