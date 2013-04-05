require 'spec_helper'

describe 'Page /blogs' do
  describe '.' do
    specify 'new-post-link should be exist' do
      visit '/blogs'
      find(:css, 'a[href="/blogs/new"]').should_not be_nil
    end

    it 'should show no article without any posts' do
      visit '/blogs'
      all(:css, 'article').should have(0).items
    end

    it 'should show articles if they exist' do
      2.times { |i| Blog.create!(title: "Post #{i}", body: 'body text') }
      visit '/blogs'
      all(:css, 'article').should have(2).items
    end
  end

  describe './:blog_id' do
    before { @blog = Blog.create! title: 'test-blog-title', body: "test-blog-body" }

    it 'should show title and body' do
      visit "/blogs/#{@blog.id}"
      find(:css, 'article h2').text.should == 'test-blog-title'
      find(:css, 'article section').text.should == 'test-blog-body'
    end

    specify 'edit-post-link should be exist' do
      visit "/blogs/#{@blog.id}"
      find(:css, %<a[href="/blogs/#{@blog.id}/edit"]>).should_not be_nil
    end
  end

  describe './new' do
    it 'should create new post' do
      expect {
        visit '/blogs/new'
        fill_in 'blog[title]', with: 'new post'
        fill_in 'blog[body]',  with: 'body text'
        find('input[type=submit]').click
        current_path.should == '/blogs'
      }.to change { Blog.count }.by(1)
    end
  end

  describe './:blog_id/edit' do
    before { @blog = Blog.create! title: 'test-blog-title', body: "test-blog-body" }

    it 'should change blog data' do
      expect {
      visit "/blogs/#{@blog.id}/edit"
        fill_in 'blog[title]', with: 'new-blog-title'
        find('input[type=submit]').click
        current_path.should == "/blogs/#{@blog.id}"
      }.to change { @blog.reload.title }.from('test-blog-title').to('new-blog-title')
    end
  end
end
