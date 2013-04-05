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
end

