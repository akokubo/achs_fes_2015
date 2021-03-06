class Post < ActiveRecord::Base
	belongs_to :homeroom
	has_many :likes
	
	validates :title, presence: true
	validates :content, presence: true
  validates :homeroom_id, presence: true
  validates :coupon, presence: true
  validates :c_content, length: { maximum: 100 }
  mount_uploader :image, ImageUploader
end
