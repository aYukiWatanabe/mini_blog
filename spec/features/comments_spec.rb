require 'spec_helper'

describe 'Page /blogs/:id' do
  describe '.' do
    before { @blog = Blog.create! title: 'test-blog-title', body: "test-blog-body" }
    it 'should create new comment' do
      expect {
        visit "/blogs/#{@blog.id}"
        fill_in 'comment[name]', with: 'name text'
        fill_in 'comment[body]', with: 'body text'
        find('input[type=submit]').click
        current_path.should == "/blogs/#{@blog.id}"
      }.to change { @blog.comments.count }.by(1)
    end
  end

  describe './:comment_id/edit' do
    before {
      @blog    = Blog.create!(title: 'test-blog-title', body: "test-blog-body")
      @comment = @blog.comments.create!(name: 'test-comment-name', body: "test-comment-body")
    }

    it 'should change blog data' do
      expect {
        visit "/blogs/#{@blog.id}/comments/#{@comment.id}/edit"
        fill_in 'comment[name]', with: 'new-comment-name'
        find('input[type=submit]').click
        current_path.should == "/blogs/#{@blog.id}"
      }.to change { @comment.reload.name }.from('test-comment-name').to('new-comment-name')
    end
  end
end
