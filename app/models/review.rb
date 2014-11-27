class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :comment, :user, :presence => true
end
