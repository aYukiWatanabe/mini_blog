require 'spec_helper'

describe User do
  describe '.create' do
    it 'should require email and password' do
      expect {
        User.create! email: 'user@host.com', password: 'password'
      }.to change { User.count }.by(1)
    end
  end
end
