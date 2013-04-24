class Blog < ActiveRecord::Base
  # ----- ----- ----- ----- fields ----- ----- ----- -----

  # see http://api.rubyonrails.org/classes/ActiveModel/MassAssignmentSecurity/ClassMethods.html
  attr_accessible :title, :body

  # see http://guides.rubyonrails.org/active_record_validations_callbacks.html
  validates :title, :body, presence: true

  # ----- ----- ----- ----- assocs ----- ----- ----- -----

  # see http://guides.rubyonrails.org/association_basics.html
  has_many :comments, order: 'created_at ASC', dependent: :destroy
end
