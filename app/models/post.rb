class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :name, presence: true
  validates_length_of :content, :minimum => 10, :allow_blank => false

 
end
