require 'spec_helper'

describe Blog do
  it 'should be creatable' do
    expect {
      Blog.create! title: 'Start blog', body: 'Today, I start blog ...'
    }.to change { Blog.count }.by(1)
  end

  describe '#title' do
    it 'should be required field' do
      expect {
        Blog.create! body: 'body text'
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#comments' do
    before { @blog = Blog.create! title: 'Hello everyone' }
    subject { @blog }

    context 'if no comment exist' do
      it { should have(0).comments }
    end

    it 'should create comment instance' do
      expect {
        @blog.comments.create! name: 'Taro'
      }.to change{ @blog.comments.count }.by(1)
    end
  end
end
