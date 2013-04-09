class Comment < ActiveRecord::Base
  # ----- ----- ----- ----- fields ----- ----- ----- -----
  attr_accessible :name, :body
  validates :body, presence: true

  # ----- ----- ----- ----- assocs ----- ----- ----- -----
  belongs_to :blog
end
