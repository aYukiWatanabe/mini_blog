require 'spec_helper'
require 'erb'

describe ApplicationHelper do
  include ERB::Util
  describe '#replace_br' do
    specify { replace_br("aa\nbb").should == 'aa<br>bb' }
  end

  describe '#error_message' do
    before { @blog = Blog.create }
    around { |test| using_locale(:en, &test) }
    specify { error_message(@blog).should == '1 error prohibited this Blog from being saved' }
  end

  def using_locale(locale)
    bck = I18n.locale
    I18n.locale = locale
    yield
  ensure
    I18n.locale = bck
  end
end
