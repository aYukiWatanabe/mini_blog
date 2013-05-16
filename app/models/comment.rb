class Comment < ActiveRecord::Base
  # ----- ----- ----- ----- fields ----- ----- ----- -----
  attr_accessible :name, :body
  attr_accessible :visible, as: :admin

  validates :body, presence: true

  # ----- ----- ----- ----- assocs ----- ----- ----- -----
  belongs_to :blog

  # ----- ----- ----- ----- scopes ----- ----- ----- -----
  scope :visible, where(:visible => true)
end
