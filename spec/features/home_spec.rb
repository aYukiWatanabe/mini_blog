require 'spec_helper'

describe 'Page /' do
  it 'should redirect to /blogs' do
    visit '/'
    current_path.should == '/blogs'
  end
end
