class Post < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates_length_of :content, :minimum => 10, :allow_blank => false

 
end
