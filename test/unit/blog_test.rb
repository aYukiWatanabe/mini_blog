require 'test_helper'

class BlogTest < ActiveSupport::TestCase

  test "Success to create" do
    assert_difference ->{ Blog.count }, 1 do
      Blog.create! title: 'Start blog', body: 'Today, I start blog ...'
    end
  end

  test "fail to create without title" do
    assert_raise ActiveRecord::RecordInvalid do
      Blog.create! body: 'No titled content'
    end
  end
end
