require 'spec_helper'

describe BlogsController do
  describe '#index' do
    subject { get :index }
    it { should render_template(:index) }

    describe 'pagination' do
      before { 10.times{ Blog.create!(title: 'title', body: 'body') } }
      specify {
        per_page = 5
        get :index, page: 2
        expected = Blog.order('created_at DESC').offset(per_page * 1).limit(per_page)
        assigns(:blogs).should == expected
      }
    end
  end

  describe '#show' do
    before { @blog = Blog.create!(title: 'title', body: 'body') }
    subject { get :show, id: @blog.id }
    it { should render_template(:show) }

    describe 'invalid id' do
      before { @blog = Blog.create!(title: 'title', body: 'body') }
      subject { get :show, id: Blog.maximum(:id) + 1 }
      it { should render_template('errors/x404') }
      its(:status) { should == 404 }
    end
  end

  context 'when user logged in' do
    before do
      sign_in User.create! email: 'user@example.com', password: 'password'
    end

    describe '#new' do
      subject { get :new }
      it { should render_template(:new) }
    end

    describe '#edit' do
      before { @blog = Blog.create!(title: 'title', body: 'body') }
      subject { get :edit, id: @blog.id }
      it { should render_template(:edit) }
    end

    describe '#create' do
      it 'should create' do
        expect {
          post :create, blog: { title: 'title', body: 'body' }
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
      before { @blog = Blog.create!(title: 'title', body: 'body') }

      it 'should update' do
        expect {
          post :update, id: @blog.id, blog: { title: 'new-title' }
        }.to change { @blog.reload.title }.from('title').to('new-title')
        response.should redirect_to blog_path(@blog.id)
      end

      it 'should fail, if title is blank' do
        expect {
          post :update, id: @blog.id, blog: { title: '' }
        }.not_to change { @blog.reload.title }
        response.status.should == 400
      end
    end

    describe '#destroy' do
      before { @blog = Blog.create!(title: 'title', body: 'body') }

      it 'should destroy' do
        expect {
          delete :destroy, id: @blog.id
        }.to change { Blog.count }.by(-1)
      end
    end

  end

end
