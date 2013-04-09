class Blog < ActiveRecord::Base
  # ----- ----- ----- ----- fields ----- ----- ----- -----
  attr_accessible :title, :body
  validates :title, presence: true

  # ----- ----- ----- ----- assocs ----- ----- ----- -----
  has_many :comments, dependent: :destroy
end
