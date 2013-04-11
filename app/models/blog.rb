class Blog < ActiveRecord::Base
  # ----- ----- ----- ----- fields ----- ----- ----- -----
  attr_accessible :title, :body
  validates :title, :body, presence: true

  # ----- ----- ----- ----- assocs ----- ----- ----- -----
  has_many :comments, order: 'created_at ASC', dependent: :destroy
end
