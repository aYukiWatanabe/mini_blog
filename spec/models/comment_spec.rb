require 'spec_helper'

describe Comment, comment: true do
  it 'should be creatable' do
    expect {
      Comment.create! name: 'Taro', body: 'Good news!, I ...'
    }.to change { Comment.count }.by(1)
  end

  describe '#body' do
    it 'should be required field' do
      expect {
        Comment.create! name: 'Taro'
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#blog_id' do
    it 'should not mass-assign-able' do
      expect {
        Comment.create! blog_id: 0, body: 'Hello'
      }.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end

    it 'should be assigned by association' do
      blog = Blog.create! title: 'New post', body: 'Body'
      comment = nil
      expect {
        comment = blog.comments.create! body: 'Hello'
      }.to change { Comment.count }.by(1)
      comment.blog_id.should == blog.id
      comment.blog.id.should == blog.id
    end
  end
end

