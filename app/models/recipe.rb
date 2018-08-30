class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates :user_id, presence: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
end
